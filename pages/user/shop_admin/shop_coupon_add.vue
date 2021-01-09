<template>
	<view>
		<view id="app">
			<view class="formWrap">



				<form class="van-form">

					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>分享小方图</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body">
								<avatar class="x-head-img" selWidth="200px" selHeight="200px" @upload="updateCouponImgFile" :avatarSrc="activity_coupon.share_pic"
								 avatarStyle="width: 200upx; height: 200upx;">
								</avatar>

							</view>
						</view>
					</view>

					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>优惠券名称</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="title" v-model="activity_coupon.title" placeholder="优惠券名称" class="van-field__control"></view>
						</view>
					</view>

					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>金额</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="cut_money" v-model="activity_coupon.cut_money" placeholder="优惠券券面金额" class="van-field__control"></view>
						</view>
					</view>

					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>满减金额</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text"  name="over_money" v-model="activity_coupon.over_money"  placeholder="满减金额 0 为无门槛" class="van-field__control"></view>
						</view>
					</view>

					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>折扣比例</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="discount" v-model="activity_coupon.discount" placeholder="折扣百分比如30为打7折" class="van-field__control"></view>
						</view>
					</view>



					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>赠送数量</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="give_num" v-model="activity_coupon.give_num" placeholder="单次赠送的数量" class="van-field__control"></view>
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
															start_at_time  || '请选择时间'
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
						<view class="van-cell__title van-field__label"><span>有效天数</span></view>
						<view class="van-cell__value van-field__value">
							
							<view class="van-field__body"><input type="text"  name="can_use_days" v-model="activity_coupon.can_use_days" placeholder="优先级高于上面设置的结束时间" class="van-field__control"></view>
						</view>
					</view>

					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>优惠券描述</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><textarea type="text" v-model="activity_coupon.content" class="van-field__control"> </textarea></view>
						</view>
					</view>
					<view class="coupon-note">
						<p>优惠券说明</p>
						<ul>
							<li>分享小方图:不设置时使用活动的小方图 设置请使用 200*200 的方形图片</li>
							<li>赠送数量:是指领取一次赠送相同优惠券的张数，默认为1张。</li>
							<li>有效天数:是指领取优惠券开始计算，多少天后优惠券失效。同时设置了结束时间时以有效天数的为准。</li>
						</ul>

					</view>
					<view style="margin: 16px;" @click="updateCoupon"><button type="submit" class="van-button van-button--info van-button--normal van-button--block van-button--round"><span
							 class="van-button__text" >
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
				activity_coupon:{},
			}
		},
		onShow(option) {
			this.reLoadSize();
			this.loadData(option)
		},
		methods: {
			loadData(option) {
				var _this = this;
				uni.showLoading({title: '加载中'});
				_this.post({
					url: '/shop_admin/addCoupon',
					data: {},
					success: function(res) {
						uni.hideLoading();
						if(res.data.err==0){
							console.log(res);
							_this.activity_coupon = res.data.data.activity_coupon;
						}
					}
				});
			},
			
			updateCouponImgFile(rsp) {
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
							_this.updateCouponImg(file);
						}
					}
				})
			},

			updateCouponImg(file) {
				var _this = this;
				file.coupon_id = _this.activity_coupon.id;
				_this.post({
					url: '/shop_admin/updateCouponImg',
					data: file ,
					success: function(res) {
						
					}
				});
			},
			//更新优惠券信息
			updateCoupon() {
				var _this = this;
				 _this.activity_coupon.start_at = _this.start_at+" " + _this.start_at_time;
				 _this.activity_coupon.end_at = _this.end_at +" "+_this.end_at_time;
				_this.post({
					url: '/shop_admin/updateCoupon',
					data: _this.activity_coupon ,
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
	.coupon-note {
		width: 100%;
		background: #FFF;
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
		color: #323233;
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
		color: #323233;
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
