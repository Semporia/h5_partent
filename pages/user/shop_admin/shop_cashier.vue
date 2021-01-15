<template>
  <view>
    <view id="app">
      <view class="formWrap">
        <form class="van-form">
          <view class="van-cell van-field">
            <view class="van-cell__title van-field__label"><span>手机号</span></view>
            <view class="van-cell__value van-field__value">
              <view class="van-field__body"><input type="text" name="user_id" v-model="user_id" placeholder="手机号或UID" class="van-field__control">
                <view class="get-code" @click="getUserCoupons">获取信息</view>
              </view>
            </view>
          </view>
		
		

          <view class="van-cell van-field">
            <view class="van-cell__title van-field__label"><span>核销码</span></view>
            <view class="van-cell__value van-field__value">
              <view class="van-field__body"><input type="text" name="hash_code" v-model="hash_code" placeholder="优惠券核销码" class="van-field__control">
                <view class="get-code">扫码</view>
              </view>
            </view>
          </view>

          <view class="van-cell van-field">
            <view class="van-cell__title van-field__label"><span>原价</span></view>
            <view class="van-cell__value van-field__value">
              <view class="van-field__body"><input type="text" name="original_price" v-model="original_price" placeholder="原价" class="van-field__control">

              </view>
            </view>
          </view>

		<view class="van-cell van-field">
            <view class="van-cell__title van-field__label"><span>订单号</span></view>
            <view class="van-cell__value van-field__value">
              <view class="van-field__body"><input type="text" name="order_code" v-model="order_code" placeholder="订单号" class="van-field__control">

              </view>
            </view>
          </view>

		<view class="van-cell van-field">
            <view class="van-cell__title van-field__label"><span>产品</span></view>
            <view class="van-cell__value van-field__value">
              <view class="van-field__body"><input type="text" name="product_rule_id" v-model="product_rule_id" placeholder="订单号" class="van-field__control">

              </view>
            </view>
          </view>

          <view class="van-cell van-field">
            <view class="van-cell__title van-field__label"><span>余额抵扣</span></view>
            <view class="van-cell__value van-field__value">
              <view class="van-field__body"><input type="text" name="password" :value="discount.balance_cut_money || 0" disabled="disabled" placeholder="余额抵扣" class="van-field__control">
              </view>
            </view>
          </view>


          <view class="van-cell van-field">
            <view class="van-cell__title van-field__label"><span>会员折扣</span></view>
            <view class="van-cell__value van-field__value">
              <view class="van-field__body"><input type="text" name="password" :value="discount.vip_cut_money || 0" disabled="disabled" placeholder="会员折扣" class="van-field__control">

              </view>
            </view>
          </view>

          <view class="van-cell van-field">
            <view class="van-cell__title van-field__label"><span>优惠券抵扣</span></view>
            <view class="van-cell__value van-field__value">
              <view class="van-field__body"><input type="text" name="password" :value="discount.user_coupon_cut_money || 0" disabled="disabled" placeholder="优惠券抵扣" class="van-field__control">

              </view>
            </view>
          </view>

          <view class="van-cell van-field">
            <view class="van-cell__title van-field__label"><span>实付款</span></view>
            <view class="van-cell__value van-field__value">
              <view class="van-field__body"><input type="text" name="password" :value="discount.real_pay || 0 " placeholder="实付款" class="van-field__control">
                <view class="get-code" @click="calculate">自动计算</view>
              </view>
            </view>
          </view>
			<view class="user_info">
				<view class="user_info_nickname">{{shop_customer.nickname}}</view>
				<view class="user_info_phone">{{shop_customer.phone}}</view>
				<view class="user_info_real_name">{{shop_customer.real_name}}</view>
			</view>
			<view class="user_coupons">
				
				<view class="ticket-list">
				<view v-for="(item,index) in user_coupons" :key="index" :class=" item.is_used ?'usedTicket' :'coupon' " style="padding: 10px 0;" @click="couponToUse(item)">
				  <view class="left">
				    <p class="num">
				      {{ item.cut_money }}
				    </p>
				    <p class="ft18">元</p>
				  </view>
				
				  <view class="center" @click="goCouponDetail(item)">
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



          <view style="margin: 16px;" @click="cashierDo"><button type="submit" class="van-button van-button--info van-button--normal van-button--block van-button--round"><span
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
		user_coupons:[],
		shop_customer:{},
		user_coupon:{},
		hash_code:'',
		user_id:0,
		original_price:0,
		product_rule_id:0,
		order_code:'',
		discount:{},
      }
    },
    onShow() {
      this.reLoadSize();
    },
    methods: {
		async getUserCoupons(){
			await this.http.post("/shop_admin/getUserCoupons",{
				'shop_id':1,
				"page_zise":1000,
				'user_id':this.user_id,
			}).then(
				async r => {
					 this.user_coupons = r.user_coupons;
					 this.shop_customer = r.shop_customer;
			    }
			)
		},
		async couponToUse(user_coupon){
			var id = user_coupon.id || 0;
			this.user_coupons = [];
			await this.http.post("/shop_admin/couponToUse",{
				'shop_id':1,
				'user_coupon_id':id,
			}).then(
				async r => {
					 this.hash_code = r.hash_code;
					 this.user_coupon = r.user_coupon;
			    }
			)
		},
		
		async cashierDo(user_coupon){
			var id = user_coupon.id || 0;
			this.user_coupons = [];
			await this.http.post("/shop_admin/cashierDo",{
				'shop_id':1,
				'user_coupon_hash_code':this.hash_code,
				'original_price':this.original_price,
				'product_rule_id':this.product_rule_id,
				'order_code':this.order_code,
			}).then(
				async r => {
					 
			    }
			)
		},
		async calculate(user_coupon){
			var id = user_coupon.id || 0;
			this.user_coupons = [];
			await this.http.post("/shop_admin/calculate",{
				'shop_id':1,
				'user_coupon_hash_code':this.hash_code,
				'original_price':this.original_price,
				'product_rule_id':this.product_rule_id,
				'order_code':this.order_code,
			}).then(
				async r => {
					 this.discount = r.discount;
			    }
			)
		}
		
    }
  }
</script>

<style>
  .get-code {
    border: solid 1px #c8c6c7;
    border-radius: 10px;
    padding: 3px;
    width: 3rem;
    font-size: .37333rem;
    text-align: center;
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
    background-color: var(--Highlight-background-color);
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
