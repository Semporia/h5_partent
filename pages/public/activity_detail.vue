<template>
  <view>
    <view id="app">
      <view id="privilegeCenter" class="pb50" v-show="show">
        <view class="member">
          <view class="left">
            <view class="logo"><img :src="shop.shop_pic"></view>
            <view class="text">
              <p class="name ft16">{{activity.title}}</p>
              <p class="endTime ft10">结束时间:{{activity.end_at}}</p>
            </view>
          </view>
          <view class="right ft12" @click="getActivity(activity)">立即领取</view>
        </view>
        <p class="black ft18">活动优惠券</p>
        <view role="feed padding" class="merchantList van-list">
          <view class="merchant">

            <view v-for="(coupon,c_index) in activity_coupons" :key="c_index">

              <view class="coupon">
                <view class="left">
                  <p class="num">{{coupon.cut_money}}</p>
                  <p class="ft18">元</p>
                </view>
                <view class="center">
                  <p class="couponName ft18 van-ellipsis">{{coupon.title}}</p>
                  <p class="ft10">有效期：{{coupon.end_at}}</p>
                  <view class="couponDetailBtn ft12" @click="goCouponDetail(coupon)">查看详情</view>
                </view>
                <view class="right ft14">
                  <p class="verticalcenter" @click="getCoupon(coupon)">立<br>即<br>领<br>取</p>
                </view>
              </view>

              <view class="x-line"></view>

            </view>

            <!-- <view class="coupon">
							<view class="left">
								<p class="num">3000</p>
								<p class="ft18">元</p>
							</view>
							<view class="center">
								<p class="couponName ft18 van-ellipsis">3000元私教抵用券</p>
								<p class="ft10">有效期：2023年6月25日0时</p>
								<view class="couponDetailBtn ft12" @click="NavTo('/pages/public/coupon_detail')">查看详情</view>
							</view>
							<view class="right ft14">
								<p class="verticalcenter">立<br>即<br>领<br>取</p>
							</view>
						</view> -->

            <view class="ft16 padding-bottom-xs margin-top margin-bottom solid-bottom">
              <icon class="icon-store text-green margin-right-xs" type="门店"></icon>服务门店</view>
            <view class="store padding flex">
              <view class="logo flex-sub"><img :src="shop.shop_pic"></view>
              <view class="detail padding-top">
                <view class="name ft16 van-multi-ellipsis--l2">{{shop.shop_name}}</view>
                <view class="ft14 padding-top-sm">
                  <icon class="icon-phone text-green margin-right-xs" type="电话"></icon>电话：{{shop.tel}}</view>
                <view class="address van-ellipsis ft10">
                  <icon class="icon-dizhi text-orange margin-right-xs" type="地址"></icon>{{shop.address}}</view>
              </view>
            </view>


            <!-- <view class="showMoreStore ft12">
							查看更多门店
						</view> -->
          </view>
          <view class="x-content">
            <view class="ft16 Details padding-bottom-xs margin-top margin-bottom solid-bottom">
              <icon class="icon-huodong text-orange margin-right-xs" type="活动详情"></icon>活动详情</view>
          </view>
          <view class="x-content margin-top margin-bottom" v-html="activity.content"></view>
          
          <view class="van-list__finished-text padding-bottom text-center">————————· 我是有底线的 ·————————</view>
          <view class="van-list__placeholder padding-bottom"></view>
        </view>


        <footnav nav=""> </footnav>

      </view>
    </view>
  </view>
</template>

<script>
  export default {
    data() {
      return {
        shop: {},
        activity_coupons: [],
        activity: {},
        show: false,

      }
    },
	onLoad(option) {
		this.loadData(option);
	},
    onShow(option) {
      this.reLoadSize();
	  
    },
    methods: {
      async loadData(option) {
        var id = option.id || 0;
        await this.http.post("/index/activityDetail", {
        	'shop_id': 1,
			'activity_id':id,
        }).then(
        	async r => {
        		this.shop = r.shop;
				this.activity_coupons = r.activity_coupons;
				this.activity = r.activity;
				this.show = true;
        	}
        )
      },

      goCouponDetail(item) {
        this.NavTo('/pages/public/coupon_detail?id=' + item.id);
      },

      async getCoupon(option){
      	var id = option.id || 0;
      	
      	await this.http.post("/coupon_api/getCoupon", {
      		'shop_id': 1,
      		'coupon_id': id,
      	}).then(
      		async r => {
      			if(r.user_coupon_id>0){
      				uni.showToast({
      					title:"获取成功"
      				})
      			}
      		}
      	)
      },
	  
	  async getActivity(option){
	  	var id = option.id || 0;
	  	
	  	await this.http.post("/coupon_api/getActivity", {
	  		'shop_id': 1,
	  		'activity_id': id,
	  	}).then(
	  		async r => {
	  			if(r.user_coupon_id>0){
	  				uni.showToast({
	  					title:"获取成功"
	  				})
	  			}
	  		}
	  	)
	  },
     


    }
  }
</script>
