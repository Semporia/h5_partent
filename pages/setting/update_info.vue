<template>
	<view>
		<view id="app">
			<view class="formWrap">
				<view class="update-headimg padding">
					<avatar  class="x-head-img"
						selWidth="200px" selHeight="200px" @upload="myUpload" :avatarSrc="user.headimgurl"
						avatarStyle="width: 200upx; height: 200upx; border-radius: 100%;">
					</avatar>
				
				</view>	
				
				<form class="van-form">
					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>真实姓名</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="real_name" v-model="shop_customer.real_name" placeholder="真实姓名" class="van-field__control"></view>
						</view>
					</view>

					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>手机号</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="tel" v-model="shop_customer.tel"  placeholder="手机号" class="van-field__control"></view>
						</view>
					</view>
					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>公司名</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="company_name"  v-model="shop_customer.company_name"  placeholder="公司名" class="van-field__control"></view>
						</view>
					</view>
					
					
					
					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>公司简称</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="company_position"  v-model="shop_customer.company_short_name"  placeholder="公司简称" class="van-field__control"></view>
						</view>
					</view>
					
					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>职务</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="company_position"  v-model="shop_customer.company_position"  placeholder="职务" class="van-field__control"></view>
						</view>
					</view>
					
					
					<view style="margin: 16px;"><button @click="updateUserInfo" type="submit" class="van-button van-button--info van-button--normal van-button--block van-button--round"><span class="van-button__text" >
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
				shop_customer:{},
				user:{}
			}
		},
		onShow() {
			this.reLoadSize();
			this.loadData();
		},
		methods: {
			
			async loadData(){
				var _this = this;
				await this.http.post("/user/info",{'shop_id':1}).then(
					async r => {
						_this.shop_customer = r.shop_customer;  
						_this.user = r.user;  
				    }
				)
			},
			
			myUpload(rsp){
				var _this = this;
				const filePath = rsp.path;
				console.log(filePath);
				_this.upload({
					url:'/Files/uploadImg',
					filePath:filePath,
					success:function(res){
						console.log(res);
						var file = res.data;
						if(res.err==0){
							_this.user.headimgurl = file.url;
							_this.updateHeadImg(file);
						}
					}
				})
				
				console.log(rsp);
			},
			//更新头像
			updateHeadImg(file){
				var _this = this;
				_this.post({
					url:'/User/updateHeadImg',
					data:file,
					success:function(res){
						
					}
				})
			},
			//更新用户信息
			updateUserInfo(){
				var _this = this;
				_this.post({
					url:'/User/updateInfo',
					data:_this.shop_customer,
					success:function(res){
						
					}
				})
			}
			
		}
	}
</script>

<style>
	.update-headimg{
		width: auto;
		text-align:center ;
		background-color: var(--Highlight-background-color);
		
	}
	.x-head-img{
		display: block;
		/* width: 2.63333rem; */
		height: 2.63333rem;
		-webkit-border-radius: 50%;
		border-radius: 50%;
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
		outline:   none;
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
	}

	.formWrap .van-cell .van-cell__title {
		font-size: .37333rem;
		font-weight: 700;
	}
</style>
