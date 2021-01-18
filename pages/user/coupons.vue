<template>
  <view>
    <view id="app">
      <view id="ticketCenter">
        <view class="van-tabs van-tabs--line">
          <view class="van-tabs__wrap van-tabs__wrap--scrollable van-hairline--top-bottom">
            <view role="tablist" class="van-tabs__nav van-tabs__nav--line">
              <view role="tab" aria-selected="true" class="van-tab" :class="{'van-tab--active':act == 'all'}" style="flex-basis: 25%;"  @click="getAll"><span
                  class="van-tab__text van-tab__text--ellipsis">全部</span></view>
              <view role="tab" class="van-tab" style="flex-basis: 25%;" :class="{'van-tab--active':act == 'over'}"><span class="van-tab__text van-tab__text--ellipsis">满减券</span></view>
              <!-- <view role="tab" class="van-tab" style="flex-basis: 22%;"><span class="van-tab__text van-tab__text--ellipsis">兑换券</span></view> -->
              <view role="tab" class="van-tab" style="flex-basis: 25%;" :class="{'van-tab--active':act == 'discount'}"><span class="van-tab__text van-tab__text--ellipsis" @click="getDiscount">折扣券</span></view>
              <view role="tab" class="van-tab" style="flex-basis: 25%;" :class="{'van-tab--active':act == 'used'}"><span class="van-tab__text van-tab__text--ellipsis" @click="getUsed">已使用</span></view>
              <view role="tab" class="van-tab" style="flex-basis: 25%;" :class="{'van-tab--active':act == 'un_used'}"><span class="van-tab__text van-tab__text--ellipsis">已过期</span></view>
              <!-- <view class="van-tabs__line" style="width: 30px; transform: translateX(30px) translateX(-50%);"></view> -->
            </view>
          </view>
          <view class="van-tabs__content">
            <view role="tabpanel" class="van-tab__pane" style="">
              <view role="feed" class="merchantList van-list" aria-busy="true">
                
				
				<view class="ticket-list">
				<view v-for="(item,index) in coupons" :key="index" :class=" item.is_used ?'usedTicket' :'coupon' ">
				  <view class="left">
				    <p class="num">
				      {{ item.cut_money }}
				    </p>
				    <p class="ft18">元</p>
				  </view>
				
				  <view class="center" @click="goUserCouponDetail(item)">
				    <p class="couponName ft18 van-ellipsis">{{item.title}}</p>
				    <p class="ft10" v-if="item.discount > 0 ">
				      <span v-if="item.over_money > 0 ">消费满{{item.over_money}}元</span>
				      <span v-if="item.discount>0">可抵扣{{item.discount}}%</span>
				      <span v-else>可使用</span>
				    </p>
				    <p class="ft10">有效期：{{item.can_use_end_at}}</p>
				  </view>
				
				  <view class="right ft14" @click="showCode(item)">
				    <p class="verticalcenter" v-if="item.is_used==0"><br>立<br>即<br>使<br>用</p>
				  </view>
				</view>
				</view>
				
				<view class="van-overlay" style="z-index: 2136;" :class="{'hide':showOrHide =='hide'}" @click="hide">
				  <view class="van-popup van-popup--center" style="z-index: 2137;">
				    <view id="qrcode" title="hash_code"><canvas width="200" height="200" style="display: none;"></canvas>
				      <img alt="Scan me!" :src="qrcode_url" style="display: block;"></view>
				  </view>
				</view>
				
                <view class="van-list__finished-text center">没有更多了</view>
                <view class="van-list__placeholder"></view>
              </view>
            </view>

          </view>
        </view>

      </view>
    </view>
  </view>
</template>

<script>
  import qrcodeshow from "@/components/qrcodeshow.vue"

  export default {
    components: {
      qrcodeshow,
    },
    data() {
      return {
        coupons: [],
        page: 1,
		act:'all',
		showOrHide:"hide",
		qrcode_url:'',
      }
    },
	onLoad() {
		this.loadData();
	},
    onShow() {
      this.reLoadSize();
      
    },
    onPullDownRefresh() {
      this.page = 1;
      console.log("刷新");
	  this.coupons=[];
      this.loadData();
    },
    onReachBottom() {
      this.page = this.page + 1;
      this.loadData();
    },
    methods: {
      async loadData() {
      		await this.http.post("/user/coupons", {
      			'shop_id': 1,
				page:this.page,
				act:this.act,
      		}).then(
      			async r => {
					if(this.page>r.page_info.total_page){
						uni.showToast({
							title:'没有更多信息'
						})
					}
      				this.coupons = this.coupons.concat(r.coupons);
      			}
      		)
      	}
      ,
	  getAll(){
	  		  this.act = 'all';
	  		   this.ref();
	  },
	  getUsed(){
		  this.act = 'used';
		   this.ref();
	  },
	  getDiscount(){
		  this.act = 'discount';
		   this.ref();
	  },
	  getUnUsed(){
		  this.act = 'un_used';
		  this.ref();
	  },
	  ref(){
		  this.page = 1;
		  this.coupons=[];
		  this.loadData();
	  },
	  async showCode(item){
		  var id = item.id || 0;
		  await this.http.post("/user/couponQr", {
		  	user_coupon_id:id,
		  }).then(
		  	async r => {
				this.showOrHide = 'show';
		  		this.qrcode_url = r.qrcode_url;
		  	}
		  )
	  },
	  hide(){
		  this.showOrHide = 'hide';
	  },
	  goUserCouponDetail(item){
		  var id = item.id || 0;
		  uni.navigateTo({
		    url: '/pages/user/coupon_detail?id='+id
		  })
	  }
    }
  }
</script>

<style>
  .coupon {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    width: 9.38667rem;
    height: 2.4rem;
    margin: 0 auto .26667rem;
    color: #fff;
    -webkit-align-content: center;
    align-content: center;
    background: url(@/static/img/coupon.red.png) no-repeat 0/100%;
  }

  .coupon .left {
    -webkit-box-flex: 11;
    -webkit-flex: 11;
    flex: 11;
    padding-top: .13333rem;
  }

  .coupon .left p {
    text-align: center;
  }

  .coupon .left .num {
    line-height: 1.0rem;
    margin-bottom: .08rem;
    font-size: .63333rem;
  }

  .coupon .center {
    position: relative;
    -webkit-box-flex: 25;
    -webkit-flex: 25;
    flex: 25;
    padding: .24rem 0 0 .21333rem;
  }

  .coupon .center .couponName {
    width: 4.93333rem;
    margin-bottom: .08rem;
    line-height: .66667rem;
  }

  .coupon .center .ft10 {
    line-height: .37333rem;
  }

  .coupon .right {
    -webkit-box-flex: 6;
    -webkit-flex: 6;
    flex: 6;
    text-align: center;
    line-height: .42667rem;
  }

  .usedTicket {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    width: 9.38667rem;
    height: 2.4rem;
    margin: 0 auto .26667rem;
    color: #fff;
    -webkit-align-content: center;
    align-content: center;
    background: url(@/static/img/used.png) no-repeat 0/100%;
  }

  .usedTicket .left {
    -webkit-box-flex: 9;
    -webkit-flex: 9;
    flex: 9;
    padding-top: .13333rem;
  }

  .usedTicket .left p {
    text-align: center;
  }

  .usedTicket .left .num {
    line-height: 1.33333rem;
    margin-bottom: .08rem;
    font-size: .93333rem;
  }

  .usedTicket .center {
    position: relative;
    -webkit-box-flex: 25;
    -webkit-flex: 25;
    flex: 25;
    padding: .24rem 0 0 .21333rem;
  }

  .usedTicket .center .couponName {
    width: 4.93333rem;
    margin-bottom: .08rem;
    line-height: .66667rem;
  }

  .usedTicket .center .ft10 {
    line-height: .37333rem;
  }




  .van-tab {
    position: relative;
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center;
    -webkit-box-pack: center;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-box-flex: 1;
    -webkit-flex: 1;
    flex: 1;
    box-sizing: border-box;
    padding: 0 .10667rem;
    color: #646566;
    font-size: .37333rem;
    cursor: pointer;
  }

  .van-tab--active {
    color: var(--text-color);
    font-weight: 500;
  }

  .van-tab__text--ellipsis {
    display: -webkit-box;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    overflow: hidden;
  }

  .van-tabs {
    position: relative;
  }

  .van-tabs__wrap {
    overflow: hidden;
  }

  .van-tabs__wrap--scrollable .van-tab {
    -webkit-box-flex: 0;
    -webkit-flex: 0 0 22%;
    flex: 0 0 22%;
  }

  .van-tabs__wrap--scrollable .van-tabs__nav {
    overflow-x: auto;
    overflow-y: hidden;
    -webkit-overflow-scrolling: touch;
  }

  .van-tabs__wrap--scrollable .van-tabs__nav::-webkit-scrollbar {
    display: none;
  }

  .van-tabs__nav {
    position: relative;
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    background-color: var(--Highlight-background-color);
    -webkit-user-select: none;
    user-select: none;
  }

  .van-tabs__nav--line {
    box-sizing: initial;
    height: 100%;
    padding-bottom: .4rem;
  }

  .van-tabs__line {
    position: absolute;
    bottom: .4rem;
    left: 0;
    z-index: 1;
    height: .08rem;
    background-color: #ee0a24;
    border-radius: .08rem;
  }

  .van-tabs--line .van-tabs__wrap {
    height: 1.17333rem;
  }

  .van-tab__pane {
    -webkit-flex-shrink: 0;
    flex-shrink: 0;
    box-sizing: border-box;
    width: 100%;
  }

  #ticketCenter .van-tab--active {
    color: #ff7214;
    font-size: .42667rem;
    width: 1.6rem;
  }

  #ticketCenter .van-tabs__line {
    background-color: #ff7214;
  }

  #ticketCenter .van-tabs__content {
    margin-top: .26667rem;
  }

  #ticketCenter .van-tab {
    -webkit-flex-basis: 16% !important;
    flex-basis: 16% !important;
  }

  .ticket-list {
    margin: 0 auto .26667rem;
  }





  .hide {
    display: none;
  }

  [class*=van-]:focus {
    outline: 0;
  }

  .van-list__finished-text {
    color: #969799;
    font-size: .37333rem;
    line-height: 1.33333rem;
    text-align: center;
  }

  .van-list__placeholder {
    height: 0;
    pointer-events: none;
  }

  [class*=van-]:focus {
    outline: none;
  }

  .van-ellipsis {
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
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

  .van-hairline--top-bottom {
    position: relative;
  }

  .van-hairline--top-bottom:after {
    border-width: .02667rem 0;
  }


  .van-overlay {
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, .7);
  }

  .van-popup {
    position: fixed;
    max-height: 100%;
    overflow-y: auto;
    background-color: var(--Highlight-background-color);
    -webkit-transition: -webkit-transform .3s;
    transition: -webkit-transform .3s;
    transition: transform .3s;
    transition: transform .3s, -webkit-transform .3s;
    -webkit-overflow-scrolling: touch;
  }

  .van-popup--center {
    top: 50%;
    left: 50%;
    -webkit-transform: translate3d(-50%, -50%, 0);
    transform: translate3d(-50%, -50%, 0);
  }

  #qrcode img {
    display: block;
    width: 100%;
    font-size: 0;
  }

  #qrcode {
    padding: .26667rem;
  }
  
  
</style>
