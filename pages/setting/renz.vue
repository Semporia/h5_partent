<template>
  <view>
    <view id="app">
      <view class="formWrap incoming">
        <view class="headText">
          <p class="ft20">申请微信支付个人认证</p>
          <p class="ft13">微信个人认证，一键查询余额，随时提现，安全便捷！</p>
        </view>
        <view class="cameraWarp flex-jb">
          <view class="left camera"><img src="data:image/png;base64,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"
              class="icon">
            <p class="ft12">身份证人像面</p><input type="file" id="upload" accept="image/*" class="upData1"><img src="" alt=""
              class="sfzI">
          </view>
          <view class="right camera"><img src="data:image/png;base64,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"
              class="icon">
            <p class="ft12">身份证国徽面</p><img src="" alt="" class="sfzI"><input type="file" id="upload1" accept="image/*"
              class="upData1">
          </view>
        </view>
        <form class="van-form">
          <view class="van-cell van-field">
            <view class="van-cell__title van-field__label"><span>身份证姓名</span></view>
            <view class="van-cell__value van-field__value">
              <view class="van-field__body"><input type="text" name="身份证姓名" placeholder="身份证姓名" class="van-field__control"></view>
            </view>
          </view>
          <view class="van-cell van-field">
            <view class="van-cell__title van-field__label"><span>身份证号码</span></view>
            <view class="van-cell__value van-field__value">
              <view class="van-field__body"><input type="text" name="身份证号码" placeholder="身份证号码" class="van-field__control"></view>
            </view>
          </view>
          <view class="van-cell van-field">
            <view class="van-cell__title van-field__label"><span>手机号码</span></view>
            <view class="van-cell__value van-field__value">
              <view class="van-field__body"><input type="text" name="手机号码" placeholder="手机号码" class="van-field__control"></view>
            </view>
          </view>
          <view class="van-cell van-field">
            <view class="van-cell__title van-field__label"><span>电子邮箱</span></view>
            <view class="van-cell__value van-field__value">
              <view class="van-field__body"><input type="text" name="电子邮箱" placeholder="电子邮箱" class="van-field__control"></view>
            </view>
          </view>
          <view role="radiogroup" class="van-radio-group van-radio-group--horizontal"><span>身份证是否是长期：</span>
            <view role="radio" tabindex="0" aria-checked="true" class="van-radio van-radio--horizontal">
              <view class="van-radio__icon van-radio__icon--round van-radio__icon--checked"><i class="van-icon van-icon-success">
                  <!----></i></view><span class="van-radio__label">不是</span>
            </view>
            <view role="radio" tabindex="-1" aria-checked="false" class="van-radio van-radio--horizontal">
              <view class="van-radio__icon van-radio__icon--round"><i class="van-icon van-icon-success">
                  <!----></i></view><span class="van-radio__label">是</span>
            </view>
          </view>
          <view role="button" tabindex="0" class="van-cell van-cell--clickable van-field">
            <view class="van-cell__title van-field__label"><span>身份证有效期</span></view>
            <view class="van-cell__value van-field__value">
              <view class="van-field__body"><input type="text" name="datetimePicker" readonly="readonly" placeholder="身份证有效期"
                  class="van-field__control">
                <view class="van-field__right-icon"><i class="van-icon van-icon-arrow">
                    <!----></i></view>
              </view>
            </view>
          </view>
          <!---->
          <view class="van-cell van-field">
            <view class="van-cell__title van-field__label"><span>开户银行名称</span></view>
            <view class="van-cell__value van-field__value">
              <view class="van-field__body"><input type="text" name="开户银行名称" placeholder="开户银行名称" class="van-field__control"></view>
            </view>
          </view>
          <view class="van-cell van-field">
            <view class="van-cell__title van-field__label"><span>开户银行省市编码</span></view>
            <view class="van-cell__value van-field__value">
              <view class="van-field__body"><input type="text" name="开户银行省市编码" placeholder="开户银行省市编码" class="van-field__control"></view>
            </view>
            <view class="hintText"><i class="van-icon van-icon-question">
                <!----></i>
              请致电开户银行官方客服电话，获取准确信息
            </view>
          </view>
          <view class="van-cell van-field">
            <view class="van-cell__title van-field__label"><span>开户银行全称(含支行)</span></view>
            <view class="van-cell__value van-field__value">
              <view class="van-field__body"><input type="text" name="开户银行全称(含支行)" placeholder="开户银行全称(含支行)" class="van-field__control"></view>
            </view>
            <view class="hintText"><i class="van-icon van-icon-question">
                <!----></i>
              请致电开户银行官方客服电话，获取准确信息
            </view>
          </view>
          <view class="van-cell van-field">
            <view class="van-cell__title van-field__label"><span>银行账号</span></view>
            <view class="van-cell__value van-field__value">
              <view class="van-field__body"><input type="text" name="银行账号" placeholder="银行账号" class="van-field__control"></view>
            </view>
          </view>
          <view class="van-cell">
            <view class="van-cell__value van-cell__value--alone"><button type="submit" class="van-button van-button--info van-button--normal van-button--block"
                style="color: rgb(255, 255, 255); background: rgb(0, 0, 0); border-color: rgb(0, 0, 0);"><span class="van-button__text">
                  确认提交
                </span></button></view>
          </view>
        </form>
      </view>
    </view>
  </view>
</template>

<script>
  export default {
    data() {
      return {

      }
    },
    onShow() {
      this.reLoadSize();
    },
    methods: {

    }
  }
</script>

<style>
  /*! CSS Used from: https://www.czg365.com/static/css/chunk-vendors.06e6c8bb.css */
  [class*=van-]:focus,
  button:focus,
  input:focus {
    outline: 0;
  }

  .van-icon {
    position: relative;
    font: normal normal normal .37333rem/1 vant-icon;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
  }

  .van-icon,
  .van-icon:before {
    display: inline-block;
  }

  .van-icon-arrow:before {
    content: "\F00A";
  }

  .van-icon-question:before {
    content: "\F0AA";
  }

  .van-icon-success:before {
    content: "\F0C8";
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

  .van-cell__value--alone {
    color: #323233;
    text-align: left;
  }

  .van-cell--clickable {
    cursor: pointer;
  }

  .van-cell--clickable:active {
    background-color: #f2f3f5;
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

  .van-field__control:read-only {
    cursor: default;
  }

  .van-field__right-icon {
    -webkit-flex-shrink: 0;
    flex-shrink: 0;
  }

  .van-field__right-icon {
    margin-right: -.21333rem;
    padding: 0 .21333rem;
    line-height: inherit;
  }

  .van-field__right-icon .van-icon {
    display: block;
    min-width: 1em;
    font-size: .42667rem;
    line-height: inherit;
  }

  .van-field__right-icon {
    color: #969799;
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

  .van-radio {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center;
    overflow: hidden;
    cursor: pointer;
    -webkit-user-select: none;
    user-select: none;
  }

  .van-radio--horizontal {
    margin-right: .32rem;
  }

  .van-radio__icon {
    -webkit-box-flex: 0;
    -webkit-flex: none;
    flex: none;
    height: 1em;
    font-size: .53333rem;
    line-height: 1em;
    cursor: pointer;
  }

  .van-radio__icon .van-icon {
    display: block;
    box-sizing: border-box;
    width: 1.25em;
    height: 1.25em;
    color: transparent;
    font-size: .8em;
    line-height: 1.25;
    text-align: center;
    border: .02667rem solid #c8c9cc;
    -webkit-transition-duration: .2s;
    transition-duration: .2s;
    -webkit-transition-property: color, border-color, background-color;
    transition-property: color, border-color, background-color;
  }

  .van-radio__icon--round .van-icon {
    border-radius: 100%;
  }

  .van-radio__icon--checked .van-icon {
    color: #fff;
    background-color: #1989fa;
    border-color: #1989fa;
  }

  .van-radio__label {
    margin-left: .21333rem;
    color: #323233;
    line-height: .53333rem;
  }

  .van-radio-group--horizontal {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    -webkit-flex-wrap: wrap;
    flex-wrap: wrap;
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

  /*! CSS Used from: https://www.czg365.com/static/css/app.655d1730.css */
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

  img {
    display: block;
    width: 100%;
    font-size: 0;
  }

  .ft12 {
    font-size: .32rem;
  }

  .ft13 {
    font-size: .34667rem;
  }

  .ft20 {
    font-size: .53333rem;
  }

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

  .van-field__right-icon {
    padding: 0;
    padding-left: .16rem;
    margin-right: 0;
  }

  .icon {
    position: relative;
    margin-right: .69333rem;
  }

  /*! CSS Used from: https://www.czg365.com/static/css/chunk-54b91d2a.1d60729e.css */
  .formWrap {
    background: #fff;
    margin: 0;
  }

  .van-radio-group {
    font-size: .42667rem;
    margin: .26667rem 0 .26667rem;
    padding: .13333rem 0 .26667rem;
    border-bottom: .02667rem solid #ebedf0;
  }

  .van-radio-group span {
    font-weight: 700;
  }

  .incoming {
    padding: .61333rem .4rem .02667rem;
  }

  .incoming .headText {
    margin-bottom: .72rem;
  }

  .incoming .headText .ft20 {
    color: #353535;
    line-height: .74667rem;
  }

  .incoming .headText .ft13 {
    color: #727272;
    line-height: .48rem;
  }

  .incoming .cameraWarp {
    margin-bottom: .96rem;
  }

  .incoming .cameraWarp .camera {
    position: relative;
    width: 4.34667rem;
    height: 3.33333rem;
    background-position: top;
    background-size: 100% auto;
    background-repeat: no-repeat;
  }

  .incoming .cameraWarp .camera .sfzI {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
  }

  .incoming .cameraWarp .camera .icon {
    position: absolute;
    width: .96rem;
    height: .96rem;
    left: 50%;
    top: 1.30667rem;
    margin-left: -.48rem;
    margin-top: -.48rem;
  }

  .incoming .cameraWarp .camera .ft12 {
    margin-top: 2.88rem;
    color: #5b5b5b;
    text-align: center;
  }

  .incoming .cameraWarp .left {
    background-image: url(https://www.czg365.com/static/img/sfz.d25da35f.png);
  }

  .incoming .cameraWarp .left .upData1 {
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    opacity: 0;
    z-index: 999;
  }

  .incoming .cameraWarp .right {
    background-image: url(https://www.czg365.com/static/img/sfzb.f16ba493.png);
  }

  .incoming .cameraWarp .right .upData1 {
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    opacity: 0;
    z-index: 999;
  }

  .incoming .van-form .van-cell {
    -webkit-flex-wrap: wrap;
    flex-wrap: wrap;
    padding: .37333rem 0;
    font-size: .42667rem;
  }

  .incoming .van-form .van-cell .van-cell__title {
    color: #303030;
    font-size: .42667rem;
  }

  .incoming .van-form .van-cell:last-child {
    margin-top: .29333rem;
  }

  .incoming .van-form .van-button {
    background-color: #1aad19 !important;
    border-color: #1aad19 !important;
    font-size: .42667rem !important;
  }

  .incoming .hintText {
    margin-top: .45333rem;
    font-size: .29333rem;
    line-height: .42667rem;
    width: 100%;
  }

  /*! CSS Used fontfaces */
</style>
