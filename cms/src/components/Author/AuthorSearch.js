// @ts-nocheck
import { Button, Form, Input, Select } from 'antd';
import { useState } from "react";
import { useEffect } from "react";
import React from 'react';
import { useForm } from 'antd/lib/form/Form';

export const AuthorSearch = ( props ) =>
{
	const [ form ] = useForm();
	const [ status, setStatus ] = useState( [] );

	useEffect( () =>
	{
		setStatus( [
			{ value: 1, label: "Active" },
			{ value: 0, label: "Inactive" }
		] );
	}, [] )


	const submitForm = ( value ) =>
	{
		if ( value.name )
		{
			value.name = value.name.trim();
		}
		if ( value.id )
		{
			value.id = value.id.trim();
		}
		props.getDatasByFilter( { page: 1, page_size: props?.paging?.page_size, ...value } );
		props.setParams( value );
	}

	const resetForm = () =>
	{
		props.getDatasByFilter( { page: 1, page_size: props?.paging?.page_size } );
		props.setParams( {
			name: null,
			email: null,
			phone: null,
			status: null,
		} );
		form.resetFields();
	}
	return (
		<Form
			name='search'
			form={ form }
			onFinish={ submitForm }
		>
			<div className="row mb-1">
				<div className="col-md-3 mb-2 form-group">
					<Form.Item name="name" label="Name" className='mb-0 d-block'>
						<Input className='form-control' placeholder='Enter name' />
					</Form.Item>
				</div>
				<div className="col-md-3 mb-2 form-group">
					<Form.Item name="email" label="Email" className='mb-0 d-block'>
						<Input className='form-control' placeholder='Enter email' />
					</Form.Item>
				</div>
				<div className="col-md-3 mb-2 form-group">
					<Form.Item name="phone" label="Phone" className='mb-0 d-block'>
						<Input className='form-control' placeholder='Enter phone' />
					</Form.Item>
				</div>
				<div className="col-md-3 mb-2">
					<Form.Item name="status" label="Status" className='mb-0 d-block'>
						<Select
							placeholder="Select status"
							style={ { width: '100%' } }
							options={ status }
						/>
					</Form.Item>
				</div>
			</div>

			<button type="submit" className="btn btn-primary" style={ { marginRight: 10, padding: '10px 10px' } }>
				<i className="nc-icon nc-zoom-split mr-2"></i>Search
			</button>

			<button type="button" className="btn btn-secondary" style={ { marginLeft: 10, padding: '10px 10px' } } onClick={ resetForm }>
				<i className="nc-icon nc-refresh-02 mr-2"></i>Reset
			</button>
		</Form>
	);
}