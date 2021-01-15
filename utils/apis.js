import { http } from '@/utils/request';

export default {
	async info(success,failure){
		http.post("/user/info");
	},
}
