<template>
  <view>
    <view id="app">
      <view class="order-body pb50">
        <view role="feed" class="van-list">

          <!-- <view class="van-tabs van-tabs--line">
						<view class="van-tabs__wrap van-hairline--top-bottom">
							<view role="tablist" class="van-tabs__nav van-tabs__nav--line">
								<view role="tab" class="van-tab van-tab--active" aria-selected="true" style="color: rgb(255, 114, 20);"><span
									 class="van-tab__text van-tab__text--ellipsis">会员</span></view>
								<view role="tab" class="van-tab" style=""><span class="van-tab__text van-tab__text--ellipsis">套餐</span></view>
								<view role="tab" class="van-tab" style=""><span class="van-tab__text van-tab__text--ellipsis">商品</span></view>
								<view role="tab" class="van-tab" style=""><span class="van-tab__text van-tab__text--ellipsis">预约服务</span></view>
								<view class="van-tabs__line" style="width: 28px; transform: translateX(47px) translateX(-50%); transition-duration: 0.3s;"></view>
							</view>
						</view> -->


          <view class="van-tabs__content">
            <view role="tabpanel" class="van-tab__pane" style="">
              <view class="order-item" v-for="(item,index) in  shop_accounts" :key="index">
                <view class="ft11 top">
                  <view class="left small">订单号:{{item.id}}</view>
                  <view class="right green">交易成功</view>
                </view>
                <view class="center"><img :src="item.product_pic || 'https://data.zhusutao.com/data/img/nopic.png'"
                    class="img">
                  <view class="flex-jb ft12 c333">
                    <p class="ft13 x-text-left">{{item.product_name}}</p>
                    <p class="spanWrap flex-jb"><span class="c666">优惠:￥{{item.user_coupon_cut_money}}</span><span>实付:￥{{item.real_pay}}</span></p>
                  </view>
                </view>
                <view class="bottom">
                  <view class="left ft10 small">消费日期:{{item.created_at}}</view>
                </view>
              </view>



            </view>

          </view>
        </view>


        <view class="van-list__placeholder"></view>
      </view>

      <footnav nav="user_order"> </footnav>
    </view>
  </view>
  </view>
</template>

<script>
  export default {
    data() {
      return {
        page: 1,
        shop_accounts: [],
      }
    },
    onShow() {
      this.reLoadSize();
      this.loadData();
    },
    methods: {
      loadData() {
        var _this = this;
        uni.showLoading({
          title: '加载中'
        });
        _this.post({
          url: '/user/getAccounts',
          data: {
            'page': _this.page
          },
          success: function(res) {
            if (res.data.err == 0) {
              _this.shop_accounts = res.data.data.shop_accounts;
            }
            uni.hideLoading();
          }

        })
      }
    }
  }
</script>

<style>
  .x-text-left {
    text-align: left;
  }

  [class*=van-]:focus {
    outline: 0;
  }

  .van-list__placeholder {
    height: 0;
    pointer-events: none;
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

  .van-hairline--top-bottom {
    position: relative;
  }

  .van-hairline--top-bottom:after {
    border-width: .02667rem 0;
  }

  * {
    margin: 0;
    padding: 0;
  }

  * {
    touch-action: pan-y;
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
    color: #323233;
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


  .van-tab__pane {
    -webkit-flex-shrink: 0;
    flex-shrink: 0;
    box-sizing: border-box;
    width: 100%;
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
    color: #323233;
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

  [class*=van-]:focus {
    outline: 0;
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

  .van-hairline--top-bottom {
    position: relative;
  }

  .van-hairline--top-bottom:after {
    border-width: .02667rem 0;
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
    color: #323233;
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

  .order-item {
    margin: .26667rem auto 0;
    width: 9.41333rem;
    box-sizing: border-box;
    padding: 0 .4rem;
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -webkit-flex-direction: column;
    flex-direction: column;
    font-size: .37333rem;
    background-color: var(--Highlight-background-color);
    border-radius: .13333rem;
  }

  .order-item .top {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    height: 1.06667rem;
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center;
  }

  .order-item .center {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    padding: .13333rem 0 .4rem;
    border-bottom: .01333rem solid #eee;
  }

  .order-item .center .img {
    margin-right: .4rem;
    box-sizing: border-box;
    padding: .16rem;
    width: 1.6rem;
    height: 1.6rem;
  }

  .order-item .center .ft12 {
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -webkit-flex-direction: column;
    flex-direction: column;
    -webkit-box-flex: 1;
    -webkit-flex-grow: 1;
    flex-grow: 1;
  }

  .order-item .bottom {
    -webkit-justify-content: space-around;
    justify-content: space-around;
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center;
    height: 1.06667rem;
    padding-bottom: 0;
    font-size: .26667rem;
    color: #909090;
  }

  .order-item .bottom {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
  }

  .order-item .left {
    -webkit-box-flex: 4;
    -webkit-flex: 4;
    flex: 4;
  }

  .order-item .right {
    text-align: right;
  }

  .order-item .green {
    color: #14b668;
  }

  .order-item .small {
    color: #999;
  }

  .order-item .c333 {
    color: #333;
  }

  .order-item .c666 {
    color: #666;
  }

  .order-item {
    margin: .26667rem auto 0;
    width: 9.41333rem;
    box-sizing: border-box;
    padding: 0 .4rem;
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -webkit-flex-direction: column;
    flex-direction: column;
    font-size: .37333rem;
    background-color: var(--Highlight-background-color);
    border-radius: .13333rem;
  }

  .order-item .top {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    height: 1.06667rem;
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center;
  }

  .order-item .center {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    padding: .13333rem 0 .4rem;
    border-bottom: .01333rem solid #eee;
  }

  .order-item .center .img {
    margin-right: .4rem;
    box-sizing: border-box;
    padding: .16rem;
    width: 1.6rem;
    height: 1.6rem;
  }

  .order-item .center .ft12 {
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -webkit-flex-direction: column;
    flex-direction: column;
    -webkit-box-flex: 1;
    -webkit-flex-grow: 1;
    flex-grow: 1;
  }

  .order-item .bottom {
    -webkit-justify-content: space-around;
    justify-content: space-around;
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center;
    height: 1.06667rem;
    padding-bottom: 0;
    font-size: .26667rem;
    color: #909090;
  }

  .order-item .bottom {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
  }

  .order-item .left {
    -webkit-box-flex: 4;
    -webkit-flex: 4;
    flex: 4;
  }

  .order-item .right {
    text-align: right;
  }

  .order-item .green {
    color: #14b668;
  }

  .order-item .small {
    color: #999;
  }

  .order-item .c333 {
    color: #333;
  }

  .order-item .c666 {
    color: #666;
  }

  .order-body {
    background-color: #f0f0f0;
    min-height: 100%;
    box-sizing: border-box;
  }

  .order-body .van-list {
    margin-bottom: .26667rem;
  }

  .order-body .van-list .van-tabs__wrap {
    height: 1.38667rem;
  }

  .order-body .van-list .van-tabs__line {
    background-color: #ff7214 !important;
    bottom: .61333rem;
  }
</style>
