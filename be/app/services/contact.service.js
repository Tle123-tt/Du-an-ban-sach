const { buildParamPaging, buildResponsePaging } = require( "../helpers/buildData.helper" );
const ContactModel = require( "../models/Contact.model" );
const Contact = require( "../models/Contact.model" );

exports.index = async ( filters ) =>
{
	const condition = {};
	const paging = buildParamPaging( filters );
	// execute query with page and limit values
	const contact = await ContactModel.find()
		.where( condition )
		.limit( paging.page_size )
		.skip( ( paging.page - 1 ) * paging.page_size )
		.exec();

	// get total documents in the Posts collection
	const count = await Contact.count().where( condition );

	// return response with posts, total pages, and current page
	const meta = buildResponsePaging( paging.page, paging.page_size, count )
	const status = 200;
	const data = {
		contacts: contact
	}
	return {
		...data,
		meta
	};
};

exports.show = async ( id ) =>
{
	const contact = await ContactModel.findOne( { _id: id } );
	return contact;
};

exports.store = async ( data ) =>
{
	const contact = new ContactModel({
        name: data.name,
        email: data.email,
        subject: data.subject,
        message: data.message,
    })
    await contact.save();
    return contact;
};

exports.delete = async ( id ) =>
{
	await ContactModel.deleteOne( { _id:id } )
	return []
};
