const UserModel = require( "../../models/User.model" );
const moment = require( "moment" );
const OrderModel = require('../../models/Order.model');
const ProductModel = require('../../models/Product.model');

const daysInMonth = ( year, month ) => new Date( year, month, 0 ).getDate();
exports.monthlyStatistics = async ( req, res ) =>
{
	// destructure page and limit and set default values
	const page = req.query.page || 1; const page_size = req.query.page_size || 10;
	try
	{
		// execute query with page and limit values

		let condition = {};
		if ( req.query?.month )
		{
			let start_date = moment().month( req.query?.month - 1 ).startOf( 'month' ).format( 'yyyy-MM-DD HH:mm:ss' );
			let end_date = moment().month( req.query?.month - 1 ).endOf( 'month' ).format( 'yyyy-MM-DD HH:mm:ss' );
			condition = {
				created_at: {
					$gte: start_date,
					$lte: end_date
				}
			}
		} else
		{
			let start_date = moment().startOf( 'month' ).format( 'yyyy-MM-DD HH:mm:ss' );
			let end_date = moment().endOf( 'month' ).format( 'yyyy-MM-DD HH:mm:ss' );
			condition = {
				created_at: {
					$gte: start_date,
					$lte: end_date
				}
			}
		}

		const responseGroupStatus = [];

		const orderData = await OrderModel.find( condition );
		if ( orderData?.length > 0 )
		{
			for ( let item of orderData )
			{
				let obj = {
					_id: {
						status: item.status
					},
					totalStatus: 1,
					totalMoney: item.total_money || 0
				};
				let oldStatus = responseGroupStatus.findIndex( e => e?._id?.status == item.status );
				if ( oldStatus < 0 )
				{
					responseGroupStatus.push( obj )
				} else
				{
					responseGroupStatus[ oldStatus ].totalMoney += item.total_price || 0;
					responseGroupStatus[ oldStatus ].totalStatus += 1;
				}
			}
		}

		console.log( 'response -------> ', responseGroupStatus );
		console.log( 'response -------> ', orderData );

		let chartStatus = [];
		if ( responseGroupStatus )
		{
			chartStatus = responseGroupStatus.reduce((newItem, item) => {
				let obj = {
					status: item._id?.status,
					total: item.totalStatus,
					price: item.totalMoney
				};
				newItem.push(obj);
				return newItem
			}, [])
		}

		const responseGroupDay = await OrderModel.aggregate( [

			{
				$group: {
					_id: { $dateToString: { format: "%Y-%m-%d", date: "$created_at" } },
					totalMoney: { $sum: "$total_price" },
					count: { $sum: 1 }
				}
			},

		] );

		const date = req.query?.month ? moment().month( req.query?.month - 1 ) : moment();
		let year = date.year();
		let month = date.format( 'MM' );
		const totalDay = daysInMonth( month, year );
		let arrListDay = [];
		for ( let i = 1; i <= totalDay; i++ )
		{
			if ( i < 10 ) i = '0' + `${ i }`;
			arrListDay.push( `${ year }-${ month }-${ i }` );
		}
		console.log( '---------- arrListDay: ', arrListDay );

		let arrListDayMapping = [];
		for ( let i = 0; i < arrListDay.length; i++ )
		{
			arrListDayMapping[ i ] = {
				day: arrListDay[ i ],
				total_price: 0,
				count: 0
			}

			for ( j = 0; j < responseGroupDay.length; j++ )
			{
				if ( responseGroupDay[ j ]._id === arrListDay[ i ] )
				{
					arrListDayMapping[ i ] = {
						day: arrListDay[ i ],
						total_price: responseGroupDay[ j ].totalMoney,
						count: responseGroupDay[ j ].count
					}
					break;
				}
			}
		}

		// console.log( '-------- KET: ', arrListDayMapping );
		let resultTotalPrice = arrListDayMapping.map( a => a.totalMoney );
		const total_room = await ProductModel.count()
		// .where(condition);
		const total_user = await UserModel.count().where( {
			type: 'USER',
			// ...condition 
		}
		);
		const total_booking = await OrderModel.count()
		// .where(condition);
		let startDate = moment().subtract( 7, 'days' ).format( 'yyyy-MM-DD' );
		let toDate = moment().format( 'yyyy-MM-DD' );
		const total_new_user = await UserModel.count()
			.where( { created_at: { $gte: startDate, $lt: toDate } } );


		const status = 200;
		const data = {
			group_status: chartStatus,
			group_day: arrListDayMapping,
			list_money_by_day: resultTotalPrice,
			list_day: arrListDay,
			total_product: total_room,
			total_user: total_user,
			total_order: total_booking,
			total_new_user: total_new_user
		}
		res.json( {
			data: data,
			status:200
		} );
	} catch ( err )
	{
		console.error( err.message );
	}
};
