import * as moment from 'moment';
export const timeDelay = async (delay) => {
	return new Promise(res => setTimeout(res, delay))
}

export const customDate =  (date, format = 'DD/MM/yyyy') => {
	if(!date) return null;
	return moment(date).format(format)
}