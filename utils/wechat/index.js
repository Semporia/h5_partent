/* eslint-disable */

import jweixin from '@/utils/wechat/jweixin.js';

export default {
	// 判断是否公众号（微信H5）
	isWechat() {
		// #ifdef H5
		const ua = window.navigator.userAgent.toLowerCase();
		if (ua.match(/micromessenger/i) == 'micromessenger') {
			return true;
		} else {
			return false;
		}
		// #endif
	},

	// wxjssdk
	async wxConfigH5(url) {
		if (this.isWechat()) {
			var jsApiList = [
				'chooseWXPay',
				'scanQRCode',
				'updateAppMessageShareData',
				'updateTimelineShareData'
			];
			await http.post('/Wechat/config', {
				js_api_params: jsApiList.join(','),
				url:url, 
				debug: false 
			})
			.then(r => {
				jweixin.config({
					...r.data
				});
			});
		}
	},

};
