<template>
	<view>
		<view id="app">
			<view class="formWrap">
				<avatar selWidth="345px" selHeight="150px" @upload="updateActivityBigFile" :avatarSrc="activity.pic" avatarStyle="width: 345upx; height: 150upx;">
				</avatar>


				<form class="van-form">

					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>分享小方图</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body">

								<avatar selWidth="200px" selHeight="200px" @upload="updateActivityShareFile" :avatarSrc="activity.share_pic"
								 avatarStyle="width: 200upx; height: 200upx;">
								</avatar>

							</view>
						</view>
					</view>


					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>活动主题</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="title" v-model="activity.title" placeholder="活动主题" class="van-field__control"></view>
						</view>
					</view>

					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>原价</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="original_price" v-model="activity.original_price"
								 placeholder="原价" class="van-field__control"></view>
						</view>
					</view>

					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>现价</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="price" v-model="activity.price" placeholder="售价 0 为免费领取"
								 class="van-field__control"></view>
						</view>
					</view>


					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>分享红包</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="give_red_envelope" v-model="activity.give_red_envelope"
								 placeholder="分享红包出去被领取获得红包金额" class="van-field__control"></view>
						</view>
					</view>

					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>活动总量</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="can_buy_num" v-model="activity.can_buy_num" placeholder="总的可供领取的份数"
								 class="van-field__control"></view>
						</view>
					</view>

					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>领取次数</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="can_buy_time" v-model="activity.can_buy_time" placeholder="最大领取次数 默认为 1"
								 class="van-field__control"></view>
						</view>
					</view>

					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>开始时间</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body">
								<picker mode="date" v-model="start_at" @change="onShowStartDatePicker">
									<view class="date" style="background: none;">{{
															start_at || '请选择日期'
														}}</view>
								</picker>
								<picker mode="time" v-model="start_at_time" @change="onShowStartTimeDatePicker">
									<view class="date" style="background: none;padding-left: 10px;">{{
															start_at_time || '请选择时间'
														}}</view>
								</picker>
								<!-- start_at_time -->
							</view>
						</view>
					</view>

					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>结束时间</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body">
								<picker mode="date" v-model="end_at" @change="onShowEndDatePicker">
									<view class="date" style="background: none;">{{
															end_at || '请选择日期'
														}}</view>
								</picker>
								<picker mode="time" v-model="end_at_time" @change="onShowEndTimeDatePicker">
									<view class="date" style="background: none; padding-left: 10px;">{{
															end_at_time || '请选择时间'
														}}</view>
								</picker>
							</view>
						</view>
					</view>

					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>合伙人专属？</span></view>
						<input type="checkbox" name="is_only_partner" id="is_only_partner" v-model="activity.is_only_partner" class="van-field__control"></input>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body">
								
							</view>
						</view>
					</view>


					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>活动简介</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><textarea type="text" name="content" v-model="activity.content" class="van-field__control"> </textarea></view>
						</view>
					</view>
					
					
					<view class="activity_coupons">
						
						<view class="ticket-list">
						<view v-for="(item,index) in activity_coupons" :key="index" :class="{'add':e(item)}" class="coupon"  style="padding: 10px 0;" @click="activityToUse(item)">
						  <view class="left">
						    <p class="num">
						      {{ item.cut_money }}
						    </p>
						    <p class="ft18">元</p>
						  </view>
						
						  <view class="center" >
						    <p class="couponName ft18 van-ellipsis">{{item.title}}</p>
						    <p class="ft10" v-if="item.discount > 0 ">
						      <span v-if="item.over_money > 0 ">消费满{{item.over_money}}元</span>
						      <span v-if="item.discount>0">可抵扣{{item.discount}}%</span>
						      <span v-else>可使用</span>
						    </p>
						    <p class="ft10">有效期：{{item.can_use_end_at}}</p>
						  </view>
					
						</view>
						</view>
						
					</view>
					
					
					<view style="margin: 16px;" @click="updateActivity"><button type="submit" class="van-button van-button--info van-button--normal van-button--block van-button--round"><span
							 class="van-button__text">
								提交
							</span></button></view>
				</form>
			</view>
		</view>
	</view>
</template>

<script>
	import avatar from "@/components/yq-avatar/yq-avatar.vue";


	export default {

		components: {
			avatar
		},
		data() {
			return {
				start_at: "",
				start_at_time: "00:00:00",
				end_at: "",
				end_at_time: "00:00:00",
				activity: {},
				activity_coupons:[],
				add_activity_coupon_ids:[],

			}
		},
		onLoad(option) {
			this.loadData(option);
		},
		onShow(option) {
			this.reLoadSize();
		},
		methods: {
			e(item){
				var a = this.add_activity_coupon_ids.indexOf(item.id);
				if(a!=-1){
					return true
				}
				return false
			},
			async loadData(option) {
				var _this = this;
				uni.showLoading({
					title: '加载中'
				});
				_this.post({
					url: '/shop_admin/addActivity',
					data: {},
					success: function(res) {
						uni.hideLoading();
						if (res.data.err == 0) {
							console.log(res);
							_this.activity = res.data.data.activity;
						}
					}
				});
				
				await this.http.post("/shop_admin/getUnSendCoupon", {
					'shop_id': 1,
					page:this.page,
					'page_size':1000,
				}).then(
					async r => {
						if(this.page>r.page_info.total_page){
							uni.showToast({
								title:'没有更多信息'
							})
						}
						this.activity_coupons = this.activity_coupons.concat(r.activity_coupons);
					}
				)
				
			},
			activityToUse(item){
				this.add_activity_coupon_ids.push(item.id);
			},
			
			updateActivityBigFile(rsp) {
				var _this = this;
				const filePath = rsp.path;
				console.log(filePath);
				_this.upload({
					url: '/Files/uploadImg',
					filePath: filePath,
					success: function(res) {
						console.log(res);
						var file = res.data;
						if (res.err == 0) {
							_this.updateActivityBigImg(file);
						}
					}
				})
			},

			updateActivityShareFile(rsp) {
				var _this = this;
				const filePath = rsp.path;
				console.log(filePath);
				_this.upload({
					url: '/Files/uploadImg',
					filePath: filePath,
					success: function(res) {
						console.log(res);
						var file = res.data;
						if (res.err == 0) {
							_this.updateActivityShareImg(file);
						}
					}
				})
			},

			updateActivityBigImg(file) {
				var _this = this;
				file.activity_id = _this.activity.id;
				_this.post({
					url: '/shop_admin/updateActivityBigImg',
					data: file,
					success: function(res) {

					}
				});
			},

			updateActivityShareImg(file) {
				var _this = this;
				file.activity_id = _this.activity.id;
				_this.post({
					url: '/shop_admin/updateActivityShareImg',
					data: file,
					success: function(res) {

					}
				});
			},

			//更新活动信息
			updateActivity() {
				var _this = this;
				_this.activity.start_at = _this.start_at + " " + _this.start_at_time;
				_this.activity.end_at = _this.end_at + " " + _this.end_at_time;
				
				this.activity['activity_id'] = this.activity.id ;
				console.log(_this.activity);
				
				_this.activity['add_activity_coupon_ids'] = this.add_activity_coupon_ids.join(',');
				_this.post({
					url: '/shop_admin/updateActivity',
					data: _this.activity,
					success: function(res) {
						uni.showToast({
							title:res.data.msg
						})
					}
				});
			},

			onShowStartDatePicker(e) {
				this.start_at = e.target.value
			},
			onShowEndDatePicker(e) {
				this.end_at = e.target.value
			},

			onShowStartTimeDatePicker(e) {
				this.start_at_time = e.target.value + ":00"
			},
			onShowEndTimeDatePicker(e) {
				this.end_at_time = e.target.value + ":00"
			},
		}
	}
</script>

<style>
	
	.add{
		background: #000000;
	}
	.activity-fimg {
		width: 4rem;
		height: 4rem;
	}

	.activity-view {
		width: 90%;
		padding: 10px 5%;
	}

	.activity-img {
		width: 100%;
	}

	[class*=van-]:focus,
	button:focus,
	input:focus {
		outline: 0;
	}

	.van-cell {
		position: relative;
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
		box-sizing: border-box;
		width: 100%;
		padding: .26667rem .42667rem;
		overflow: hidden;
		color: var(--text-color);
		font-size: .37333rem;
		line-height: .64rem;
		background: var(--Highlight-background-color);
	}

	.van-cell:not(:last-child):after {
		position: absolute;
		box-sizing: border-box;
		content: " ";
		pointer-events: none;
		right: 0;
		bottom: 0;
		left: .42667rem;
		border-bottom: .02667rem solid #ebedf0;
		-webkit-transform: scaleY(.5);
		transform: scaleY(.5);
	}

	.van-cell__title,
	.van-cell__value {
		-webkit-box-flex: 1;
		-webkit-flex: 1;
		flex: 1;
	}

	.van-cell__value {
		position: relative;
		overflow: hidden;
		color: #969799;
		text-align: right;
		vertical-align: middle;
		word-wrap: break-word;
	}

	.van-field__label {
		-webkit-box-flex: 0;
		-webkit-flex: none;
		flex: none;
		box-sizing: border-box;
		width: 2.4rem;
	}

	.van-field__value {
		overflow: visible;
	}

	.van-field__body {
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
		-webkit-box-align: center;
		-webkit-align-items: center;
		align-items: center;
	}

	.van-field__control {
		display: block;
		box-sizing: border-box;
		width: 100%;
		min-width: 0;
		margin: 0;
		padding: 0;
		color: var(--text-color);
		line-height: inherit;
		text-align: left;
		background-color: initial;
		border: 0;
		resize: none;
	}

	.van-field__control::-webkit-input-placeholder {
		color: #969799;
	}

	.van-field__control::placeholder {
		color: #969799;
	}

	.van-field__control:disabled {
		color: #969799;
		background-color: initial;
		cursor: not-allowed;
		opacity: 1;
		-webkit-text-fill-color: currentColor;
	}

	.van-button {
		position: relative;
		display: -webkit-inline-box;
		display: -webkit-inline-flex;
		display: inline-flex;
		-webkit-box-align: center;
		-webkit-align-items: center;
		align-items: center;
		-webkit-box-pack: center;
		-webkit-justify-content: center;
		justify-content: center;
		box-sizing: border-box;
		height: 1.17333rem;
		margin: 0;
		padding: 0;
		font-size: .42667rem;
		line-height: 1.2;
		text-align: center;
		border-radius: .05333rem;
		cursor: pointer;
		-webkit-transition: opacity .2s;
		transition: opacity .2s;
		-webkit-appearance: none;
	}

	.van-button:before {
		position: absolute;
		top: 50%;
		left: 50%;
		width: 100%;
		height: 100%;
		background-color: #000;
		border: inherit;
		border-color: #000;
		border-radius: inherit;
		-webkit-transform: translate(-50%, -50%);
		transform: translate(-50%, -50%);
		opacity: 0;
		content: " ";
	}

	.van-button:active:before {
		opacity: .1;
	}

	.van-button--info {
		color: #fff;
		background-color: #1989fa;
		border: .02667rem solid #1989fa;
	}

	.van-button--normal {
		padding: 0 .4rem;
		font-size: .37333rem;
	}

	.van-button--block {
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
		width: 100%;
	}

	.van-button--round {
		border-radius: 26.64rem;
	}

	button,
	input {
		color: inherit;
		font: inherit;
	}

	[class*=van-]:focus,
	button:focus,
	input:focus {
		outline: none;
	}

	* {
		margin: 0;
		padding: 0;
	}

	* button,
	* input {
		border: none;
	}

	input {
		outline: none;
		-webkit-appearance: none;
		-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	}

	* {
		touch-action: pan-y;
	}

	.van-cell .van-cell__title {
		font-size: .25rem;
	}

	#app {
		width: 100%;
		height: 100%;
	}

	.van-cell:not(:last-child):after {
		border-bottom: 0;
	}

	.formWrap {
		margin-top: .26667rem;
	}

	.formWrap .van-cell .van-cell__title {
		font-size: .37333rem;
		font-weight: 700;
	}
</style>
