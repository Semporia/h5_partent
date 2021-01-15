<template>
	<view>
		<view id="app">
			<view id="myGeneralize">
				<view class="codeWrap ft14">
					我的邀请码:
					<i class="van-icon van-icon-question">
						<!----></i>
					<p class="code ft28">37695</p>
				</view>
				<view class="fansWrap margin solid radius">
					<p class="ft18">我的粉丝</p>
					<ul class="fansList">
						<li class="fans flex-jb van-hairline--bottom"   @click="NavTo('/pages/user/partner/partner_accounts')" >
							<view class="left"><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKKu8XG0qLywIoxxMjv7OAYGps5xyJheC8YvahN6aNOuOawnTwMmaodxJfjZJlVcdBiavst5nIYm6Q/132">
								<p class="ft18 van-ellipsis">Miss_娜娜</p>
							</view>
							<view class="right ft12">
								<p class="icon-link">2020/12/16 19:28</p>
							</view>
						</li>
						<li class="fans flex-jb van-hairline--bottom"   @click="NavTo('/pages/user/partner/partner_accounts')">
							<view class="left"><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9WGvMacyAQXvX3MoQ9n2p1NmQfG53ibtrMhJz96KD9ibVLOiaXI0SzKQrCxGuNaHF0pPvpvImZtr9g/132">
								<p class="ft18 van-ellipsis">Ｗ ei 儿</p>
							</view>
							<view class="right ft12">
								<p class="icon-link">2020/12/16 15:13</p>
							</view>
						</li>
						<li class="fans flex-jb van-hairline--bottom"   @click="NavTo('/pages/user/partner/partner_accounts')">
							<view class="left"><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/niaoHvmuL0EE5K6HDwOOVX5ycXgHfcBynD2OLeib1sYpicCpciaiavSep5ibXDSlVzn9Jrw97yica6QyHLkPQTgnU4wkQ/132">
								<p class="ft18 van-ellipsis">注塑之家18658483830</p>
							</view>
							<view class="right ft12">
								<p class="icon-link">2020/12/16 13:54</p>
							</view>
						</li>
						<li class="fans flex-jb van-hairline--bottom"   @click="NavTo('/pages/user/partner/partner_accounts')">
							<view class="left"><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJGtG01ksyBtkx7jqPAe4KrmNHwRKia6mibhib52n3PGhsOrtWUNRob5erwHpickWwujAFMEHicK0ydrQQ/132">
								<p class="ft18 van-ellipsis">丟了微笑葽怎伪裝</p>
							</view>
							<view class="right ft12">
								<p class="icon-link">2020/12/15 10:00</p>
							</view>
						</li>
						<li class="fans flex-jb van-hairline--bottom"   @click="NavTo('/pages/user/partner/partner_accounts')">
							<view class="left"><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo6lyGpEShLCvEkZy2NFqBXhUVASz2u0NSPjbPPTxO2zstQNicfASU3cTfbflToq5LNQYdeqITvtgA/132">
								<p class="ft18 van-ellipsis">應俊傑（应俊杰）</p>
							</view>
							<view class="right ft12">
								<p class="icon-link">2020/12/14 21:00</p>
							</view>
						</li>
						<li class="fans flex-jb van-hairline--bottom"   @click="NavTo('/pages/user/partner/partner_accounts')">
							<view class="left"><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKvkLF6FIjLAyXia1j8ILvmm10TwpsWLAk6mPMcyV4eVgZicg2gUHFxAa9dHFFprb7cCCiamuY9yibWBw/132">
								<p class="ft18 van-ellipsis">一切都会过去</p>
							</view>
							<view class="right ft12">
								<p class="icon-link">2020/12/16 12:29</p>
							</view>
						</li>
						<li class="fans flex-jb van-hairline--bottom"   @click="NavTo('/pages/user/partner/partner_accounts')">
							<view class="left"><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuUlSvfYF9VhOHca58gXqOgGEibp9YhOmVfcqzSx7MaPia6l01J1oVNsKuNMdCtmhj2aIQNsgvZhqw/132">
								<p class="ft18 van-ellipsis">墨紫&amp;微醺</p>
							</view>
							<view class="right ft12">
								<p class="icon-link">2020/12/12 09:50</p>
							</view>
						</li>
						<li class="fans flex-jb van-hairline--bottom"   @click="NavTo('/pages/user/partner/partner_accounts')">
							<view class="left"><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKgYuT4PMHzd3NFicTiaSRcYdW3zocILr6E4C0gNfeFt9uzeV7da7mUpm0AEQoOiazvr30l5jHmicz5JA/132">
								<p class="ft18 van-ellipsis">A 西雅图美业💋智薰</p>
							</view>
							<view class="right ft12">
								<p class="icon-link">2020/12/10 14:19</p>
							</view>
						</li>
						<li class="fans flex-jb van-hairline--bottom"   @click="NavTo('/pages/user/partner/partner_accounts')">
							<view class="left"><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLSrpu0ZJm6pibwwQU67ia1ibCCicXfpmPMtTlJhIDvIrESf939bt0icf9BmIEXunweVZP4QiaIsVjp8CSQ/132">
								<p class="ft18 van-ellipsis">美业(门店+学校)策划导师-雷哥</p>
							</view>
							<view class="right ft12">
								<p class="icon-link">2020/12/10 14:14</p>
							</view>
						</li>
						<li class="fans flex-jb van-hairline--bottom"   @click="NavTo('/pages/user/partner/partner_accounts')">
							<view class="left"><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/I9NiagNxWTibvsnDFrlNWLRQickOVBIGyMohOt5nx0Mb7pXbmiawnucNdKBLttyv73syP1Au2dkMN0BzMlggAwtuAg/132">
								<p class="ft18 van-ellipsis">坐拥百态</p>
							</view>
							<view class="right ft12">
								<p class="icon-link">2020/12/08 21:54</p>
							</view>
						</li>
						<li class="fans flex-jb van-hairline--bottom"   @click="NavTo('/pages/user/partner/partner_accounts')">
							<view class="left"><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLOgqkXdyrgWnQjrvCEXFs54BPBqbYfic4Pw90k2qRKdorx4qoYibD6wMAmMMFAdeE9xGxzic41p5G5A/132">
								<p class="ft18 van-ellipsis">晓玉</p>
							</view>
							<view class="right ft12">
								<p class="icon-link">2020/12/08 19:58</p>
							</view>
						</li>
						<li class="fans flex-jb van-hairline--bottom"   @click="NavTo('/pages/user/partner/partner_accounts')">
							<view class="left"><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIM4iamRcx1aa6a7AwDLSuJHTEghY7VetnJw1AxBBdoELgyDglYVyKw08U3medJIDsibDR98ja3aTuQ/132">
								<p class="ft18 van-ellipsis">明珠（lili ）studio</p>
							</view>
							<view class="right ft12">
								<p class="icon-link">2020/12/08 19:46</p>
							</view>
						</li>
						<li class="fans flex-jb van-hairline--bottom"   @click="NavTo('/pages/user/partner/partner_accounts')">
							<view class="left"><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep8wh1M9qCzqfRMmAAuia8PlWsicEia0oicyNSxQmjKafLY1gmuia77l62BroqQPpwrb9XovlqpvIqANsA/132">
								<p class="ft18 van-ellipsis">竺长江</p>
							</view>
							<view class="right ft12">
								<p class="icon-link">2020/12/08 14:44</p>
							</view>
						</li>
						<li class="fans flex-jb van-hairline--bottom"   @click="NavTo('/pages/user/partner/partner_accounts')">
							<view class="left"><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJt18m6r8LJW5bwVYvYwSQBIFLhfABrA1ROyg5hzCDWRBVUr16NNvhRRh8o9picY9skhibrYEmjnGrA/132">
								<p class="ft18 van-ellipsis">许广淼</p>
							</view>
							<view class="right ft12">
								<p class="icon-link">2020/12/08 13:33</p>
							</view>
						</li>
						<li class="fans flex-jb van-hairline--bottom"   @click="NavTo('/pages/user/partner/partner_accounts')">
							<view class="left"><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqrZoBHUwEfzDA7ES8s1RwvNlK9YFbMgW9vqZrxVDaENc8NfXicWGWR9tGcyMIwnYsUvzzJ1I338aQ/132">
								<p class="ft18 van-ellipsis">房产经纪人范炜坤 「18067381096」</p>
							</view>
							<view class="right ft12">
								<p class="icon-link">2020/12/08 10:13</p>
							</view>
						</li>
						<li class="fans flex-jb van-hairline--bottom"   @click="NavTo('/pages/user/partner/partner_accounts')">
							<view class="left"><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/quaAPZib2arYia7XhUQAd83k70yAEJibW6eYSGpuMDI5jqe2NZsbN71oL5hcibBh8megFHvlIRXoQBoNwC3sbEk6jA/132">
								<p class="ft18 van-ellipsis">形象管理-艺秦</p>
							</view>
							<view class="right ft12">
								<p class="icon-link">2020/12/07 15:38</p>
							</view>
						</li>
						<li class="fans flex-jb van-hairline--bottom"   @click="NavTo('/pages/user/partner/partner_accounts')">
							<view class="left"><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epWjfLTcLCvZiamaJcSnm7acXrY6ib37x7TFDmJFlBzLX6WkSDYHiatACAicD6ia5qiaDmDE9TChYR78vTA/132">
								<p class="ft18 van-ellipsis">心蕊商学院，徐玄</p>
							</view>
							<view class="right ft12">
								<p class="icon-link">2020/12/06 21:28</p>
							</view>
						</li>
						<li class="fans flex-jb">
							<view class="left"><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLrIcw03ibKkkjD2qvs2zPRsV2ibAVEH85sh8eO4aQFVNnZTdxDrs077XLVQ7iaaFbrnZwdCkmsW9Q5Q/132">
								<p class="ft18 van-ellipsis">修芔虓帅</p>
							</view>
							<view class="right ft12">
								<p class="icon-link">2020/12/06 19:52</p>
							</view>
						</li>
					</ul>
				</view>
				<!---->
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
	[class*=van-]:focus {
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

	.van-icon-question:before {
		content: "\F0AA";
	}

	[class*=van-]:focus {
		outline: none;
	}

	ul {
		margin: 0;
		padding: 0;
		list-style: none;
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
		border: 0 solid var(--border-color);
		-webkit-transform: scale(.5);
		transform: scale(.5);
	}

	.van-hairline--bottom {
		position: relative;
	}

	.van-hairline--bottom:after {
		border-bottom-width: .02667rem;
	}

	img {
		display: block;
		width: 100%;
		font-size: 0;
	}

	.ft12 {
		font-size: .32rem;
	}

	.ft14 {
		font-size: .37333rem;
	}

	.ft18 {
		font-size: .48rem;
	}

	.ft28 {
		font-size: .74667rem;
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

	#app {
		width: 100%;
		height: 100%;
	}

	#myGeneralize .van-hairline--bottom:after {
		border-color: var(--border-color);
	}

	#myGeneralize .codeWrap {
		width: 8.45333rem;
		margin: .4rem auto;
		padding: .53333rem .48rem;
		border-radius: .18667rem;
		background: var(--Highlight-background-color);
	}

	#myGeneralize .codeWrap .code {
		margin-top: .26667rem;
		color: #ff3c46;
	}

	#myGeneralize .fansWrap {
		background: var(--Highlight-background-color);
		padding: .53333rem .42667rem;
	}

	#myGeneralize .fansWrap .fansList {
		color:  var(--text-color);
	}

	#myGeneralize .fansWrap .fansList .fans {
		padding: .53333rem 0;
	}

	#myGeneralize .fansWrap .fansList .fans .left img {
		display: inline-block;
		width: 1.06667rem;
		height: 1.06667rem;
		margin-right: .26667rem;
		border-radius: 50%;
		vertical-align: middle;
	}

	#myGeneralize .fansWrap .fansList .fans .left .ft18 {
		display: inline-block;
		width: 4.13333rem;
		vertical-align: middle;
	}

	#myGeneralize .fansWrap .fansList .fans .right {
		vertical-align: middle;
		color:  var(--text-color);
	}

	#myGeneralize .fansWrap .fansList .fans .right .icon-link {
		line-height: 1.06667rem;
	}

	#myGeneralize .fansWrap .fansList .fans .right .icon-link:before {
		content: " ";
		display: inline-block;
		width: .42667rem;
		height: .42667rem;
		margin-right: .21333rem;
		vertical-align: middle;
		background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAADhAJiYAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAJKADAAQAAAABAAAAJAAAAAAqDuP8AAADdElEQVRYCe2WXWiOYRjH3yGztSGN+Yhmy8QIWU0NZQfSciCJciBSvqIcKHM0tJIShQPlZAeSEycU2kSafM5nhORjpVmEbCSf8/s/e67t3uN+tmeyA/Ve9Xuu67q/3v973ff9vG8qlbZ0BdIV6N8KZPTv8sHqBTyLw895gm8KY6/rT0E5fOImqIh8cj35EfgcaQ/Sgb7GhG1jGJcNvoXVvhvKIGpFNJRCA3yLdva1QhpfCashF2Qf4ChcUIJpzD4oURJaC74VJsCQsO0ZvgrawjxwfamQxmqB5ZAZzO54ZOHKYTTcgF/wCtTWDjVwGM7CKdD4yTACZkO3SiUVpHHbYT7EWSEdU+EqNMM1uBd6XGDfed6EQTANJEpz6iCwJIJ8YpqYfQ4egL6xFpapSnPgOrwGVcpn92nU+dK8USCR7yDVmyCfGJV+J9yGu6D8B8wE2XBQJevhj0NLm0xbmQ+qkuwL3FIwQI8Y84k5w9iDIAFmWvwEHLMGfB6sd3JfaIdbfWNtQJygODGHmCgBMp2DxUHU8TiOe+Pk84jjdmAwfdpaM1UoMJ+gJGI0eQVshq2gObpduspmmQQjLYn4DeTaMrNGC6KCkorR/AXhIovwG8N4WOjldKPeOrmF6wgqLcE/houWRwVJuXu1dWbcbbJ5Ej7OEry2T7YX9Hsl0037GURdj1WES7vS1AvialB1A9PCZjrxWyzB60rXgJ0ZpytoW0hDTtioqysBzXAe9EV1yDvPBrG2WILMJKYKPlqDvFuhuW4H8UnwibFhegGaDSXYD3qv6AbWwnswW0KwxhK8V4z6XUGdVy+cqBdbT1ZLZ4szQNVa6+QW6rzoKJjFitEAd8smkU+xWfiH8NLJo2EWDZehHLLDzkK8fp+UK14Jy8CsRzEa5ArSfutc6NdaVgR62+q2RG06DQdA23YaXFG66qVQBuPBrFcxGugK0hVV2a1KucQSdQnawUwfuAd0bnQjr0BUFE3dLJEYzXAFKb8D+uM1UQmmc1UAjaBKzYJdoMMr+wp10ATaPn2BfHCtgUS3tdVtjIszPB066NugwumTmDYwIer6BDvgqZLQtN4MKAbN0UvvESQ2nyBN9olyF/WJcfv/Oo5umS2kM6MDq29ZAu44fetq0Ln45xZXIfeD8kh00PU79RwkqPNVT5y2dAXSFfivKvAbwGiphhS0scYAAAAASUVORK5CYII=) no-repeat;
		background-size: 100%;
	}

	/*! CSS Used fontfaces */
	@font-face {
		font-weight: 400;
		font-family: vant-icon;
		font-style: normal;
		font-display: auto;
		src: url(@/static/fonts/vant-icon-db1de1.woff2) format("woff2"), url(@/static/fonts/vant-icon-db1de1.woff) format("woff"), url(@/static/fonts/vant-icon-db1de1.ttf) format("truetype");
	}
</style>
