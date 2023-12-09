import * as moment from 'moment';
export const timeDelay = async (delay) => {
	return new Promise(res => setTimeout(res, delay))
}

export const customDate =  (date, format = 'DD/MM/yyyy') => {
	if(!date) return null;
	return moment(date).format(format)
}

export const prices = [
    {
        value : "Dưới 60.000",
		from: 0,
		to: 60000,
        id : 1
    },
    {
        value : "60.000 -> 180.000",
		from: 60000,
		to: 180000,
        id : 2
    },
    {
        value : "180.000 -> 500.000",
		from: 180000,
		to: 500000,
        id : 3
    },
    {
        value : "500.000 -> 1.000.000",
		from: 500000,
		to: 1000000,
        id : 4
    },
]