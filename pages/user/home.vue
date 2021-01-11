<template>
  <view>
    <view id="app">
      <view class="pb50 mine">
        <view class="my-info margin-bottom">
          <view class="my-content flex-jb">
            <view class="left padding-top padding-left"><img :src="user.headimgurl" class="my-avatar">
              <view class="my-name ft22">{{user.nickname}}
                <view class="ft14" style="margin-top: 7px;">UID：{{user.id}}</view>
              </view><img src="../../static/img/vip.png" class="vipIcon">
            </view>
            <img src="../../static/img/Preference.png" class="setting padding-right" @click="NavTo('/pages/setting/index')">
          </view>
        </view>
        <view class="my-wallet">
          <view class="line1 ft11 flex-jb" @click="NavTo('/pages/user/accounts')">
            <view>账户余额
              <p class="ft32">{{ shop_customer.money || '0.00' }}</p>
            </view>
            <p class="text">我的账单</p>
          </view>
          <view class="line2 flex-jb ft10">
            <view>
              我的积分
              <span class="icon icon-right-down"></span>
              <p class="ft18">{{shop_customer.integral || '0.00'}}</p>
            </view>
            <view class="van-hairline--left" @click="NavTo('/pages/user/coupons')">
              我的优惠券
              <span class="icon icon-right-down"></span>
              <p class="ft18">{{coupons_num}}</p>
            </view>
          </view>
        </view>
        <view id="function">


          <!-- 	<view class="vip99 is99 flex-jb">
						<view class="left flex-jb"><img src="../../static/img/vip.png">
							<view class="ft14"><span>欢迎回来！</span>
								<p class="bold">車总管99会员</p>
							</view>
							<p class="ft13 bcG cfff">领取权益</p>
						</view>
						<view class="right flex"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADgAAAA4CAYAAACohjseAAAACXBIWXMAABYlAAAWJQFJUiTwAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAGsSURBVHgB7ZmBcYMwDABFJ0g3oKN0knSFTtBukm6SETKC2YBsoIrDvVISalmSMbT6Ox93CUh6zhhsAziO4ziOUw1EfKHWYz6B2jEVv4HKDIXSoQUZ16ZpHn874QHqcwA5yWu3IPhKrYP/SnxGF4E9k5IzFaRYB2rv1M4oI3BGvRw5M0GK08YCtfTMfEtyx/kPYIGR3EBg5FqUi//bCiKzqzDoMdFFU3KlBC+zmCdqmnfXUp6kXDzPXHBOC8Zw5e7VA1rMA97GZ8sVqcc84M/YWXJF6jEP+B03Wy5eN515JEdlTiHmglK5ybUBGaMytxhTQY1cESwFNycXizIR3KRcLEwtuFm5WJxKEOWj5ddaTSh6IzSCqBstw+R81ixEhFQQld1SmjcbhWCQymnyZqMQ7KVymrzZKARVXxxWgsmF33lwWmhdZbHYKu8W1kWL4oJ7xwX3jgvunWxBLLAmeidHC2uBt5stp5IF4LjJ8zHLeYFSUPA3rI94Psj5VBu65HAHW6hDR19pTyAk+QxS8CsdnqHONnMXc68DjjOEC5bnjOOjUXxAcxzHcZy/zCd8furmFuEVygAAAABJRU5ErkJggg=="
							 class="img24">
							<p class="ft10 cfff">推广赚钱</p>
						</view>
					</view> -->



          <view class="l1 flex-ja ft14 solid radius">
            <view class="list" @click="NavTo('/pages/public/join')"><img src="../../static/img/carefreeWang_1.png">
              共享合伙人
            </view>
            <view class="list" @click="NavTo('/pages/public/join')"><img src="../../static/img/carefreeWang_2.png">
              事业合伙人
            </view>
            <!-- <li @click="NavTo('/pages/public/join')"><img src="../../static/img/carefreeWang_3.png">
							逍遥神
						</li> -->
          </view>
          <img class="margin-top margin-bottom" src="../../static/img/hd.png" alt="">


          <!-- 					<view class="detail99 ft10">
						<view class="line1 flex-jb">
							<view>
								<p class="ft16 bold">車总管99会员</p>
								可得99元全额佣金额度
							</view>
							<p class="ft12" @click="NavTo('/pages/user/partner/partner_accounts')">查看明细</p>
						</view>
						<view class="line2 flex-jb">
							<view>
								<p class="ft14"><span class="ft20">9981</span>/10000</p>
								剩余/总数
							</view>
							<view><span class="giveBtn ft13 cfff">赠送</span><span class="ft13 cfff bcG">转卖</span></view>
						</view>
					</view> -->


          <view class="l2 flex-ja ft14 text-center solid radius">
            <view class="list" @click="NavTo('/pages/user/partner/partner_customers')"><img src="../../static/img/promote.png">
              我的推广
            </view>
            <view class="list" @click="NavTo('/pages/user/my_activitys')"><img src="../../static/img/mealIcon.png">
              我的活动
            </view>
            <view class="list" @click="NavTo('/pages/user/coupons')"><img src="../../static/img/coupon.png">
              我的优惠券
            </view>
            <view class="list" @click="NavTo('/pages/user/renz')"><img src="../../static/img/incoming.png">
              个人认证
            </view class="list">
            <view class="list"><img src="../../static/img/rz.png">
              更新资料
            </view>
            <view class="list"><img src="../../static/img/address.png">
              收货地址
            </view>
          </view>

        </view>


        <toggle-user-home></toggle-user-home>
        <footnav nav="user_home"> </footnav>
      </view>
    </view>
  </view>
</template>

<script>
  import toggleUserHome from "@/components/toggle-user-home"
  export default {
    components: {
      toggleUserHome
    },
    data() {
      return {
        user: {},
        shop: {},
        shop_customer: {},
        partner_rule: {},
        extInfo: {
          total_pay: {},
          un_pay: {}
        },
        coupons_num: 0,
        footPrintList: [],
      }
    },
    onLoad() {
      this.reLoadSize();
      this.user = this.getLocalUser();

    },
    onShow() {
      this.loadData();
    },
    methods: {
      loadData() {
        var _this = this;
        _this.post({
          url: '/user/home',
          data: {},
          success: function(res) {
            _this.shop = res.data.data.shop;
            _this.partner_rule = res.data.data.partner_rule;
            if (res.data.err == 0) {
              _this.user = res.data.data.user;
              _this.extInfo = res.data.data.extInfo;
              _this.footPrintList = res.data.data.foot_print;
              _this.shop_customer = res.data.data.shop_customer;
              _this.coupons_num = res.data.data.coupons_num;
              uni.setStorageSync('common', res.data.data);
              uni.setStorageSync('user', res.data.data.user);
              _this.hasLogin = true;
            } else {
              uni.setStorageSync('user', {});
            }

            if (res.data.err == 403) {
              uni.navigateTo({
                url: '/pages/login/login'
              })

              console.log("403");
              return
            }
          }
        });
      }

    }
  }
</script>

<style>
  [class*=van-]:focus {
    outline: 0;
  }

  [class*=van-]:focus {
    outline: none;
  }

  ul {
    margin: 0;
    padding: 0;
    list-style: none;
  }

  [class*=van-hairline]:after {
    position: absolute;
    box-sizing: border-box;
    content: " ";
    pointer-events: none;
    top: -50%;
    right: -50%;
    bottom: -50%;
    left: -50%;
    border: 0 solid #ebedf0;
    -webkit-transform: scale(.5);
    transform: scale(.5);
  }

  .van-hairline--left {
    position: relative;
  }

  .van-hairline--left:after {
    border-left-width: .02667rem;
  }

  .pb50 {
    padding-bottom: 1.33333rem;
  }

  img {
    display: block;
    width: 100%;
    font-size: 0;
  }

  .ft10 {
    font-size: .26667rem;
  }

  .ft11 {
    font-size: .29333rem;
  }

  .ft12 {
    font-size: .32rem;
  }

  .ft13 {
    font-size: .34667rem;
  }

  .ft14 {
    font-size: .37333rem;
  }

  .ft16 {
    font-size: .42667rem;
  }

  .ft18 {
    font-size: .48rem;
  }

  .ft20 {
    font-size: .53333rem;
  }

  .ft22 {
    font-size: .58667rem;
  }

  .ft32 {
    font-size: .85333rem;
  }

  .bold {
    font-weight: 600;
  }

  .bcG {
    background-color: #ff7214;
  }

  .cfff {
    color: #fff;
  }

  .img24 {
    width: .64rem;
    height: .64rem;
  }

  .flex {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
  }

  .flex-1 {
    -webkit-box-flex: 1;
    -webkit-flex: 1;
    flex: 1;
  }

  .flex-1,
  .flex-jb {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
  }

  .flex-jb {
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    justify-content: space-between;
  }

  .flex-ja {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    -webkit-justify-content: space-around;
    justify-content: space-around;
  }

  .flex-center {
    -webkit-box-pack: center;
    -webkit-justify-content: center;
    justify-content: center;
  }

  .flex-center {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center;
  }

  .w-100 {
    width: 100%;
  }

  #app {
    width: 100%;
    height: 100%;
  }

  .icon {
    position: relative;
    margin-right: .69333rem;
  }

  .icon-right-down:before {
    content: "";
    position: absolute;
    left: 0;
    display: block;
  }

  .icon-right-down:before {
    top: 0;
    height: .37333rem;
    width: .37333rem;
    background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAABYlAAAWJQFJUiTwAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAACoSURBVHgB7ZQhDsMwEATXVUlDTfuI0NI+orSlxX1HP1JaHprX5A3ORjGNso7OkSLdSCuT9Xl0wIDjOM4RSCm1zJuJQjfmbguBEzRuzDTwI0jE3L3DUODHDHm4IiEjCYQQpse/NSTUDVSTkAVqSRQJ1JAoFrCW2CRgKbFZYEkin/sILEg8Su6flRJX2/C4rtT+zItpYC1Anpi/V3NUgZ65oIwOjuM4R2AE8sxNOHYcQiIAAAAASUVORK5CYII=) no-repeat;
    background-size: .37333rem .37333rem;
  }



  .my-info {
    height: 2.82667rem;
    background-color: var(--Highlight-background-color);
  }

  .my-info .setting {
    width: .64rem;
    display: inline-block;
  }

  @media (prefers-color-scheme: dark) {
    .my-info .setting {
      -webkit-filter: brightness(0) invert(1);
      filter: brightness(0) invert(1);
    }
  }

  .my-info .my-content {
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center;
  }

  .my-info .my-content .left {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center;
  }

  .my-info .my-content .left .my-avatar {
    display: inline-block;
    width: 1.33333rem;
    height: 1.33333rem;
    border-radius: 50%;
  }

  .my-info .my-content .left .my-name {
    margin-left: .26667rem;
    vertical-align: middle;
    font-family: PingFangSC-Semibold;
    color: var(--text-color);
  }

  .my-info .my-content .left .vipIcon {
    margin-left: .37333rem;
    width: .66667rem;
  }

  .my-wallet {
    margin: 0 auto;
    width: 95%;
    height: 4rem;
    color: #fff;
    background: url(../../static/img/wallet.jpg) 50%/100%;
    box-shadow: 0 .26667rem .26667rem rgba(0, 0, 0, .1);
    border-radius: .42667rem;
  }

  .my-wallet .line1 {
    padding: .53333rem .42667rem 0 .53333rem;
  }

  .my-wallet .line1 .ft32 {
    line-height: 1.2rem;
  }

  .my-wallet .line1 .text {
    padding-top: .98667rem;
  }

  .my-wallet .line2 {
    margin-top: .53333rem;
  }

  .my-wallet .line2 view {
    width: 50%;
    height: 1.01333rem;
    padding-left: .53333rem;
  }

  .my-wallet .line2 .ft18 {
    margin-top: .08rem;
    line-height: .66667rem;
  }

  #function {
    margin: .26667rem auto;
    width: 95%;
  }

  #function .vip99 {
    margin: .26667rem auto;
    width: 9.36rem;
    height: 1.76rem;
    border-radius: .88rem;
  }

  #function .is99 {
    box-sizing: border-box;
    padding-right: .16rem;
  }

  #function .is99 .left {
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center;
    width: 6.64rem;
    padding: .26667rem;
  }

  #function .is99 .left img {
    width: 1.22667rem;
    height: 1.22667rem;
  }

  #function .is99 .left .ft14 {
    line-height: .53333rem;
  }

  #function .is99 .left .ft13 {
    margin-top: .29333rem;
    width: 1.89333rem;
    height: .64rem;
    line-height: .64rem;
    text-align: center;
    border-radius: .32rem;
  }

  #function .is99 .right {
    width: 1.76rem;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -webkit-flex-direction: column;
    flex-direction: column;
    -webkit-box-pack: center;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center;
  }

  #function .is99 .right img {
    margin-bottom: .13333rem;
  }

  #function .is99 {
    background: url(../../static/img/generalize.png) no-repeat 0/auto 100%;
  }

  #function .l1 {
    width: 100%;
    padding: .4rem 0 .32rem;
    text-align: center;
    background-color: var(--Highlight-background-color);
    color: var(--text-color);
  }

  #function .l1 .list img {
    margin: 0 auto;
    padding-bottom: .26667rem;
    width: 1.52rem;
    height: 1.52rem;
  }

  #function .detail99 {
    margin: .26667rem auto;
    padding: .4rem .34667rem;
    height: 2.21333rem;
    background: var(--Highlight-background-color);
    color: var(--text-color);
  }

  #function .detail99 .line1 {
    margin-bottom: .26667rem;
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center;
  }

  #function .detail99 .line1 .ft16 {
    margin-bottom: .13333rem;
    color: #3b3b3b;
  }

  #function .detail99 .line2 {
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center;
  }

  #function .detail99 .line2 .ft14 {
    line-height: .74667rem;
    color: #000;
  }

  #function .detail99 .line2 .ft13 {
    display: inline-block;
    margin-left: .4rem;
    width: 1.49333rem;
    line-height: .64rem;
    border-radius: .32rem;
    text-align: center;
  }

  #function .detail99 .line2 .giveBtn {
    background: #ff4646;
  }

  #function .l2 {
    padding: .48rem 0;
    -webkit-flex-wrap: wrap;
    flex-wrap: wrap;
    background-color: var(--Highlight-background-color);
    color: var(--text-color);
  }

  #function .l2 .list {
    width: 33%;
    margin: .32rem 0;
  }

  #function .l2 .list img {
    margin: 0 auto;
    width: .85333rem;
    height: .85333rem;
    padding-bottom: .26667rem;
  }
</style>
