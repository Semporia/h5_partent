<template>
	<view>
		<view id="app">
			<view class="formWrap">
				<form class="van-form">
					
					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>UID</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="user_id" v-model="user_id" placeholder="手机号或UID" class="van-field__control">
							<view class="get-code" @click="getCustomerDetails">获取信息</view>
							</view>
						</view>
					</view>
					
					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>真实姓名</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" v-model="shop_customer.real_name" placeholder="真实姓名" class="van-field__control">
							</view>
						</view>
					</view>
					
					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>公司名称</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="company_name" v-model="shop_customer.company_name" placeholder="公司名称" class="van-field__control">
							</view>
						</view>
					</view>
					
					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>公司简称</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="company_short_name"  v-model="shop_customer.company_short_name" placeholder="公司简称" class="van-field__control">
							</view>
						</view>
					</view>
					
					
					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>赠送金额</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="give_money" v-model="shop_customer.give_money" placeholder="赠送消费金额" class="van-field__control">
							</view>
						</view>
					</view>
					
					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>VIP折扣</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="discount" v-model="shop_customer.discount" placeholder="到店消费折扣 如 5% 填写 5" class="van-field__control">
							</view>
						</view>
					</view>
					
					
					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>收益分成</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="partner_point" v-model="shop_customer.partner_point" placeholder="收益分成 如 25% 填写 25" class="van-field__control">
							</view>
						</view>
					</view>
					
					
					<view class="van-cell van-field">
						<view class="van-cell__title van-field__label"><span>合伙人称号</span></view>
						<view class="van-cell__value van-field__value">
							<view class="van-field__body"><input type="text" name="partner_title" v-model="shop_customer.partner_title" placeholder="合伙人称号" class="van-field__control">
							</view>
						</view>
					</view>
					

					<view style="margin: 16px;" @click="addPartner"><button type="submit" class="van-button van-button--info van-button--normal van-button--block van-button--round"><span
							 class="van-button__text">
								提交
							</span></button></view>
				</form>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				user_id:0,
				shop_customer:{id:0},
			}
		},
		onShow() {
			this.reLoadSize();
		},
		methods: {
			async getCustomerDetails() {
				var _this = this;
				
				await this.http.post("/shop_admin/getCustomerDetails", {
					'shop_id': 1,
					'user_id':this.user_id
				}).then(
					async r => {
						_this.shop_customer = r.shop_customer;

					}
				)
			},
			async addPartner() {
				var _this = this;
				this.shop_customer['shop_id'] = 1;
				this.shop_customer['user_id'] = this.user_id;
				await this.http.post("/shop_admin/addPartner", 
					this.shop_customer
				).then(
					async r => {
						
					}
				)
			}
			
			
		}
	}
</script>

<style>
.get-code{
	border:solid 1px #c8c6c7;
	border-radius: 10px;
	padding: 3px;
	width: 3rem;
	font-size:.37333rem;
	text-align: center;
}
[class*=van-]:focus,button:focus,input:focus{outline:0;}
.van-cell{position:relative;display:-webkit-box;display:-webkit-flex;display:flex;box-sizing:border-box;width:100%;padding:.26667rem .42667rem;overflow:hidden;color:#323233;font-size:.37333rem;line-height:.64rem;background-color:#fff;}
.van-cell:not(:last-child):after{position:absolute;box-sizing:border-box;content:" ";pointer-events:none;right:0;bottom:0;left:.42667rem;border-bottom:.02667rem solid #ebedf0;-webkit-transform:scaleY(.5);transform:scaleY(.5);}
.van-cell__title,.van-cell__value{-webkit-box-flex:1;-webkit-flex:1;flex:1;}
.van-cell__value{position:relative;overflow:hidden;color:#969799;text-align:right;vertical-align:middle;word-wrap:break-word;}
.van-field__label{-webkit-box-flex:0;-webkit-flex:none;flex:none;box-sizing:border-box;width:2.4rem;}
.van-field__value{overflow:visible;}
.van-field__body{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-align:center;-webkit-align-items:center;align-items:center;}
.van-field__control{display:block;box-sizing:border-box;width:100%;min-width:0;margin:0;padding:0;color:#323233;line-height:inherit;text-align:left;background-color:initial;border:0;resize:none;}
.van-field__control::-webkit-input-placeholder{color:#969799;}
.van-field__control::placeholder{color:#969799;}
.van-field__control:disabled{color:#969799;background-color:initial;cursor:not-allowed;opacity:1;-webkit-text-fill-color:currentColor;}
.van-button{position:relative;display:-webkit-inline-box;display:-webkit-inline-flex;display:inline-flex;-webkit-box-align:center;-webkit-align-items:center;align-items:center;-webkit-box-pack:center;-webkit-justify-content:center;justify-content:center;box-sizing:border-box;height:1.17333rem;margin:0;padding:0;font-size:.42667rem;line-height:1.2;text-align:center;border-radius:.05333rem;cursor:pointer;-webkit-transition:opacity .2s;transition:opacity .2s;-webkit-appearance:none;}
.van-button:before{position:absolute;top:50%;left:50%;width:100%;height:100%;background-color:#000;border:inherit;border-color:#000;border-radius:inherit;-webkit-transform:translate(-50%,-50%);transform:translate(-50%,-50%);opacity:0;content:" ";}
.van-button:active:before{opacity:.1;}
.van-button--info{color:#fff;background-color:#1989fa;border:.02667rem solid #1989fa;}
.van-button--normal{padding:0 .4rem;font-size:.37333rem;}
.van-button--block{display:-webkit-box;display:-webkit-flex;display:flex;width:100%;}
.van-button--round{border-radius:26.64rem;}
button,input{color:inherit;font:inherit;}
[class*=van-]:focus,button:focus,input:focus{outline:none;}

*{margin:0;padding:0;}
* button,* input{border:none;}
input{outline:none;-webkit-appearance:none;-webkit-tap-highlight-color:rgba(0,0,0,0);}
*{touch-action:pan-y;}
.van-cell .van-cell__title{font-size:.25rem;}
#app{width:100%;height:100%;}
.van-cell:not(:last-child):after{border-bottom:0;}

.formWrap{margin-top:.26667rem;}
.formWrap .van-cell .van-cell__title{font-size:.37333rem;font-weight:700;}
</style>
