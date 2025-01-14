// @ts-nocheck
import { Form, Input, Select, Switch, Upload } from 'antd';
import { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import React from 'react';
import Widget from '../Widget/Widget';
import { useForm } from 'antd/lib/form/Form';
import { toSlug } from '../../helpers/common/common';
import { useHistory, useParams } from 'react-router-dom/cjs/react-router-dom.min';
import { submitForms } from '../../services/blogService';

import { toggleShowLoading } from '../../redux/actions/common';
import { DiscountService, submitDiscountForm } from '../../services/discountService';
export const DiscountForm = ( props ) =>
{
	const [ form ] = useForm();
	const [ status, setStatus ] = useState( [] );
	const [ data, setData ] = useState( null );
	const dispatch = useDispatch();
	const history = useHistory();
	const params = useParams();
	const [ id, setId ] = useState( null );

	useEffect( () =>
	{
		setStatus( [
			{ value: 1, label: "Active" },
			{ value: 0, label: "Inactive" }
		] );
	}, [] );

	useEffect( () =>
	{
		if ( params.id )
		{
			setId( params.id );
			getData( params.id );
		} else {
			form.setFieldValue('max_process', 0)
		}
	}, [ params.id ] );


	useEffect( () =>
	{
		if ( data )
		{

			let formValue = {
				name: data.name,
				price: data.price,
				status: data.status,
				max_use: data.max_use,
				max_process: data.max_process || 0,
				code: data.code || 0
			}
			form.setFieldsValue( formValue )

		}
	}, [ data ] )

	const getData = async ( id ) =>
	{
		try
		{
			dispatch( toggleShowLoading( true ) )
			const response = await DiscountService.show( id );

			if ( response?.status === 200 )
			{
				setData( response?.data )
			}
			dispatch( toggleShowLoading( false ) );
		} catch ( error )
		{
			dispatch( toggleShowLoading( false ) );
		}
	}

	const validateMessages = {
		required: '${label} is required!',
		types: {
			email: '${label} is not a valid email!',
			number: '${label} is not a valid number!',
		},
		number: {
			range: '${label} must be between ${min} and ${max}',
		},
	};

	const submitForm = async ( e ) =>
	{
		e.code =e.code.replaceAll(' ', '')
		await submitDiscountForm( id, e, dispatch, history );
	}

	const resetForm = () =>
	{
		form.resetFields();
	}

	const onFieldsChange = ( e ) =>
	{
		if ( e.length > 0 )
		{
			let value = typeof e[ 0 ].value === 'string' ? e[ 0 ].value : e[ 0 ].value;
			console.log(e);
			if ( e[ 0 ].name[ 0 ] === 'code' && value != '' && value != null )
			{
				form.setFieldsValue( { code: value.trim() } );
			}
			let fieldValue = {
				[ String( e[ 0 ].name[ 0 ] ) ]: value
			}
			form.setFieldsValue( fieldValue );
		}
	}


	return (
		<div className="w-75 mx-auto">
			<Widget>
				<Form
					className='p-3'
					name='nest-messages form'
					form={ form }
					onFinish={ submitForm }
					onFieldsChange={ onFieldsChange }
					validateMessages={ validateMessages }
				>
					<div className='mb-3'>
						<Form.Item name="name" label="Name"
							rules={ [ { required: true } ] }
							className=' d-block'>
							<Input className='form-control' placeholder='Enter name' />
						</Form.Item>

						<div className='row'>
							<div className='col-12 col-md-6'>
								<Form.Item name="code" label="Code"
									rules={ [ { required: true } ] }
									className=' d-block'>
									<Input className='form-control' placeholder='Enter code' />
								</Form.Item>
							</div>
							<div className='col-12 col-md-6'>
								<Form.Item name="price" label="Price"
									rules={ [ { required: true } ] }
									className=' d-block'>
									<Input type="number" className='form-control' placeholder='Enter price' />
								</Form.Item>
							</div>

							{/* <div className='col-12 col-md-6'>
								<Form.Item name="max_use" label="Max use"
									rules={ [ { required: true } ] }
									className=' d-block'>
									<Input type="number" className='form-control' placeholder='Enter value' />
								</Form.Item>
							</div> */}

							<div className='col-12 col-md-6'>
								<Form.Item name="status" label="Status"
									rules={ [ { required: true } ] } className='d-block'>
									<Select
										placeholder="Select status"
										style={ { width: '100%' } }
										options={ status }
									/>
								</Form.Item>
							</div>
						</div>
					</div>

					<div className='d-flex justify-content-center'>
						<button type="submit" className="btn btn-primary text-center" style={ { marginRight: 10, padding: '10px 10px' } }>
							{ !id && 'Create' || 'Update' }
						</button>

						{ !id && <button type="button" className="btn btn-secondary text-center" style={ { marginLeft: 10, padding: '10px 10px' } } onClick={ resetForm }>
							Reset
						</button> }
					</div>
				</Form>
			</Widget >
		</div>

	)
}