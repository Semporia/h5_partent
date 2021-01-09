<template>
	<view>
		<view id="app">
			<view id="app"><img src="../../static/img/logo_bind.jpg" alt="" class="image">
				<view class="wrap" style="width: 100%;">
					<view class="title">请确认您的邀请人</view>
					<view class="main">
						<img calss="avatar" src="http://data.zhusutao.com/data/img/head.jpg" alt="" style="width: 20%; margin-left: 40%; border-radius: 50%;">
						<view class="nick_name">小葱</view>
						<view style="text-align: center;padding:10px 5px;">邀请码:NMCy</view>
						<view class="tipC">我想换个邀请码</view>
					</view>
					<view class="main" style="display: block;">
						<view>
							<view class="van-cell van-field">
								<view class="van-cell__value van-cell__value--alone van-field__value">
									<view class="van-field__body"><input type="text" placeholder="请输邀请码" class="van-field__control"></view>
								</view>
							</view>
						</view>
						<view class="tipC">没有邀请码？</view>
					</view><button class="next van-button van-button--default van-button--normal" style="color: rgb(255, 255, 255); background: rgb(32, 40, 44); border-color: rgb(32, 40, 44);"><span
						 class="van-button__text">下一步</span></button>
					<view class="tipBottom">产生消费后邀请人不可更改</view>
				</view>
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

	.van-button--default {
		color: #323233;
		background: var(--Highlight-background-color);
		border: .02667rem solid #ebedf0;
	}

	.van-button--normal {
		padding: 0 .4rem;
		font-size: .37333rem;
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

	#app {
		width: 100%;
		height: 100%;
	}

	.wrap {
		display: inline-block;
	}

	/*! CSS Used from: https://www.czg365.com/static/css/chunk-dd20bad6.5619a9ac.css */
	.image,
	.wrap {
		width: 100%;
	}

	.wrap .title {
		font-size: .48rem;
		color: #000;
		text-align: center;
		margin: 8% 0;
		font-weight: 700;
	}

	.wrap .main {
		width: 100%;
	}

	.wrap .main .nick_name {
		font-size: .48rem;
		text-align: center;
		margin: 5% 0;
	}

	.wrap .main .tipC {
		font-size: .34667rem;
		color: #ff7214;
		text-align: center;
	}

	.wrap .main .van-cell {
		width: 80%;
		margin-left: 10%;
		margin-bottom: 5%;
	}

	.wrap .next {
		width: 80%;
		margin-left: 10%;
		height: 1.06667rem;
		line-height: 1.06667rem;
		font-size: .42667rem;
		margin-top: 5%;
	}

	.wrap .tipBottom {
		margin-top: 5%;
		font-size: .32rem;
		text-align: center;
		color: #ff2c2c;
	}
</style>
