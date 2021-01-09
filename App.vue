<script>
  export default {
    onLaunch: function() {
      console.log('App Launch')
    },
    onShow: function() {
      console.log('App Show')

    },
    onHide: function() {
      console.log('App Hide')
    }
  }
</script>


<!-- 

屏蔽iso 底部按钮
<meta name="x5-fullscreen" content="true">
<meta name="full-screen" content="yes"> 

-->
<style>
  @import url("@/static/style/common.css");
  @import url("@/static/style/icon.css");

  [class^="icon-"],
  [class*=" icon-"] {
    display: inline-block;
    font-family: "iconfont" !important;
    font-size: 14px;
    font-style: normal;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }

  /* 深色主题 */
  @media (prefers-color-scheme: dark) {
    :root {

      --Default-background-color: #0D1117;
      --Highlight-background-color: #161B22;
      --text-color: #8B949E;
      --text-active-color: #C9D1D9;
      --border-color: #30363D;
      --hover-color: #FF3C46;
      --hover-border-color: #F9826C;
      --btn-text-color: #FF3C46;
      --btn-backgroud-color: #FFFFFF;
      --tabbar-background-color: #161B22;
      --green: #39B54A;
      --orange: #FF4500;
    }
  }

  /*浅色主题 */
  @media (prefers-color-scheme: light) {
    :root {
      --Default-background-color: #F2F2F2;
      --Highlight-background-color: #FFFFFF;
      --text-color: #24292E;
      --text-active-color: #C9D1D9;
      --border-color: #E1E4E8;
      --hover-color: #FF3C46;
      --hover-border-color: #F9826C;
      --btn-text-color: #FF3C46;
      --btn-backgroud-color: #FFFFFF;
      --tabbar-background-color: #161B22;
      --green: #39B54A;
      --orange: #FF4500;
    }
  }

  .body {
    color: var(--text-color);
    background-color: var(--Default-background-color) !important;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    font-size: calc(10px + 2vmin);
    transition: background-color 0.3s;
  }
  img {
    display: block;
    width: 100%;
    font-size: 0;
  }
  /* ---------- 实线 ---------- */
  .solid,
  .solid-top,
  .solid-right,
  .solid-bottom,
  .solid-left,
  .dashed,
  .dashed-top,
  .dashed-right,
  .dashed-bottom,
  .dashed-left {
    position: relative;
  }

  .solid::after,
  .solid-top::after,
  .solid-right::after,
  .solid-bottom::after,
  .solid-left::after,
  .dashed::after,
  .dashed-top::after,
  .dashed-right::after,
  .dashed-bottom::after,
  .dashed-left::after {
    content: " ";
    width: 200%;
    height: 200%;
    position: absolute;
    top: 0;
    left: 0;
    border-radius: inherit;
    transform: scale(0.5);
    transform-origin: 0 0;
    pointer-events: none;
    box-sizing: border-box;
  }

  .solid::after {
    border: 2upx solid var(--border-color);
  }

  .solid-top::after {
    border-top: 2upx solid var(--border-color);
  }

  .solid-right::after {
    border-right: 2upx solid var(--border-color);
  }

  .solid-bottom::after {
    border-bottom: 2upx solid var(--border-color);
  }

  .solid-left::after {
    border-left: 2upx solid var(--border-color);
  }

  .border-xs {
    border-radius: 20upx;
    border: 2upx solid;
  }
  .radius{
    border-radius: 10upx;
  }
  /* ---------- 布局 ---------- */

  /* -- flex弹性布局 -- */
  .flex {
    display: flex;
  }

  .basis-xs {
    flex-basis: 20%;
  }

  .basis-sm {
    flex-basis: 40%;
  }

  .basis-df {
    flex-basis: 50%;
  }

  .basis-lg {
    flex-basis: 60%;
  }

  .basis-xl {
    flex-basis: 80%;
  }

  .flex-sub {
    flex: 1;
  }

  .flex-twice {
    flex: 2;
  }

  .flex-treble {
    flex: 3;
  }

  .flex-direction {
    flex-direction: column;
  }

  .flex-wrap {
    flex-wrap: wrap;
  }

  .align-start {
    align-items: flex-start;
  }

  .align-end {
    align-items: flex-end;
  }

  .align-center {
    align-items: center;
  }

  .align-stretch {
    align-items: stretch;
  }

  .self-start {
    align-self: flex-start;
  }

  .self-center {
    align-self: flex-center;
  }

  .self-end {
    align-self: flex-end;
  }

  .self-stretch {
    align-self: stretch;
  }

  .align-stretch {
    align-items: stretch;
  }

  .justify-start {
    justify-content: flex-start;
  }

  .justify-end {
    justify-content: flex-end;
  }

  .justify-center {
    justify-content: center;
  }

  .justify-between {
    justify-content: space-between;
  }

  .justify-around {
    justify-content: space-around;
  }

  /* grid布局 */
  .grid {
    display: flex;
    flex-wrap: wrap;
  }

  .grid.grid-square {
    overflow: hidden;
  }

  .grid.grid-square .cu-tag {
    position: absolute;
    right: 0;
    top: 0;
    border-bottom-left-radius: 6upx;
    padding: 6upx 12upx;
    height: auto;
    background-color: rgba(0, 0, 0, 0.5);
  }

  .grid.grid-square>view>text[class*="icon-"] {
    font-size: 52upx;
    position: absolute;
    color: #8799a3;
    margin: auto;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
  }

  .grid.grid-square>view {
    margin-right: 20upx;
    margin-bottom: 20upx;
    border-radius: 6upx;
    position: relative;
    overflow: hidden;
  }

  .grid.grid-square>view.bg-img image {
    width: 100%;
    height: 100%;
    position: absolute;
  }

  .grid.col-1.grid-square>view {
    padding-bottom: 100%;
    height: 0;
    margin-right: 0;
  }

  .grid.col-2.grid-square>view {
    padding-bottom: calc((100% - 20upx)/2);
    height: 0;
    width: calc((100% - 20upx)/2);
  }

  .grid.col-3.grid-square>view {
    padding-bottom: calc((100% - 40upx)/3);
    height: 0;
    width: calc((100% - 40upx)/3);
  }

  .grid.col-4.grid-square>view {
    padding-bottom: calc((100% - 60upx)/4);
    height: 0;
    width: calc((100% - 60upx)/4);
  }

  .grid.col-5.grid-square>view {
    padding-bottom: calc((100% - 80upx)/5);
    height: 0;
    width: calc((100% - 80upx)/5);
  }

  .grid.col-2.grid-square>view:nth-child(2n),
  .grid.col-3.grid-square>view:nth-child(3n),
  .grid.col-4.grid-square>view:nth-child(4n),
  .grid.col-5.grid-square>view:nth-child(5n) {
    margin-right: 0;
  }

  .grid.col-1>view {
    width: 100%;
  }

  .grid.col-2>view {
    width: 50%;
  }

  .grid.col-3>view {
    width: 33.33%;
  }

  .grid.col-4>view {
    width: 25%;
  }

  .grid.col-5>view {
    width: 20%;
  }

  /* ---------- 内外边距 ---------- */
  .margin {
    margin: 30upx;
  }

  .margin-0 {
    margin: 0;
  }

  .margin-xs {
    margin: 10upx;
  }

  .margin-sm {
    margin: 20upx;
  }

  .margin {
    margin: 30upx;
  }

  .margin-lg {
    margin: 40upx;
  }

  .margin-xl {
    margin: 50upx;
  }

  .margin-top-xs {
    margin-top: 10upx;
  }

  .margin-top-sm {
    margin-top: 20upx;
  }

  .margin-top {
    margin-top: 30upx;
  }

  .margin-top-lg {
    margin-top: 40upx;
  }

  .margin-top-xl {
    margin-top: 50upx;
  }

  .margin-right-xs {
    margin-right: 10upx;
  }

  .margin-right-sm {
    margin-right: 20upx;
  }

  .margin-right {
    margin-right: 30upx;
  }

  .margin-right-lg {
    margin-right: 40upx;
  }

  .margin-right-xl {
    margin-right: 50upx;
  }

  .margin-bottom-xs {
    margin-bottom: 10upx;
  }

  .margin-bottom-sm {
    margin-bottom: 20upx;
  }

  .margin-bottom {
    margin-bottom: 30upx;
  }

  .margin-bottom-lg {
    margin-bottom: 40upx;
  }

  .margin-bottom-xl {
    margin-bottom: 50upx;
  }

  .margin-left-xs {
    margin-left: 10upx;
  }

  .margin-left-sm {
    margin-left: 20upx;
  }

  .margin-left {
    margin-left: 30upx;
  }

  .margin-left-lg {
    margin-left: 40upx;
  }

  .margin-left-xl {
    margin-left: 50upx;
  }

  .margin-lr-xs {
    margin-left: 10upx;
    margin-right: 10upx;
  }

  .margin-lr-sm {
    margin-left: 20upx;
    margin-right: 20upx;
  }

  .margin-lr {
    margin-left: 30upx;
    margin-right: 30upx;
  }

  .margin-lr-lg {
    margin-left: 40upx;
    margin-right: 40upx;
  }

  .margin-lr-xl {
    margin-left: 50upx;
    margin-right: 50upx;
  }

  .margin-tb-xs {
    margin-top: 10upx;
    margin-bottom: 10upx;
  }

  .margin-tb-sm {
    margin-top: 20upx;
    margin-bottom: 20upx;
  }

  .margin-tb {
    margin-top: 30upx;
    margin-bottom: 30upx;
  }

  .margin-tb-lg {
    margin-top: 40upx;
    margin-bottom: 40upx;
  }

  .margin-tb-xl {
    margin-top: 50upx;
    margin-bottom: 50upx;
  }

  .padding-0 {
    padding: 0;
  }

  .padding-xs {
    padding: 10upx;
  }

  .padding-sm {
    padding: 20upx;
  }

  .padding {
    padding: 30upx;
  }

  .padding-lg {
    padding: 40upx;
  }

  .padding-xl {
    padding: 50upx;
  }

  .padding-top-xs {
    padding-top: 10upx;
  }

  .padding-top-sm {
    padding-top: 20upx;
  }

  .padding-top {
    padding-top: 30upx;
  }

  .padding-top-lg {
    padding-top: 40upx;
  }

  .padding-top-xl {
    padding-top: 50upx;
  }

  .padding-right-xs {
    padding-right: 10upx;
  }

  .padding-right-sm {
    padding-right: 20upx;
  }

  .padding-right {
    padding-right: 30upx;
  }

  .padding-right-lg {
    padding-right: 40upx;
  }

  .padding-right-xl {
    padding-right: 50upx;
  }

  .padding-bottom-xs {
    padding-bottom: 10upx;
  }

  .padding-bottom-sm {
    padding-bottom: 20upx;
  }

  .padding-bottom {
    padding-bottom: 30upx;
  }

  .padding-bottom-lg {
    padding-bottom: 40upx;
  }

  .padding-bottom-xl {
    padding-bottom: 50upx;
  }

  .padding-left-xs {
    padding-left: 10upx;
  }

  .padding-left-sm {
    padding-left: 20upx;
  }

  .padding-left {
    padding-left: 30upx;
  }

  .padding-left-lg {
    padding-left: 40upx;
  }

  .padding-left-xl {
    padding-left: 50upx;
  }

  .padding-lr-xs {
    padding-left: 10upx;
    padding-right: 10upx;
  }

  .padding-lr-sm {
    padding-left: 20upx;
    padding-right: 20upx;
  }

  .padding-lr {
    padding-left: 30upx;
    padding-right: 30upx;
  }

  .padding-lr-lg {
    padding-left: 40upx;
    padding-right: 40upx;
  }

  .padding-lr-xl {
    padding-left: 50upx;
    padding-right: 50upx;
  }

  .padding-tb-xs {
    padding-top: 10upx;
    padding-bottom: 10upx;
  }

  .padding-tb-sm {
    padding-top: 20upx;
    padding-bottom: 20upx;
  }

  .padding-tb {
    padding-top: 30upx;
    padding-bottom: 30upx;
  }

  .padding-tb-lg {
    padding-top: 40upx;
    padding-bottom: 40upx;
  }

  .padding-tb-xl {
    padding-top: 50upx;
    padding-bottom: 50upx;
  }

  /* ---------- 文本 ----------*/
  .text-xs {
    font-size: 20upx;
  }

  .text-sm {
    font-size: 24upx;
  }

  .text-df {
    font-size: 28upx;
  }

  .text-lg {
    font-size: 32upx;
  }

  .text-xl {
    font-size: 36upx;
  }

  .text-xxl {
    font-size: 44upx;
  }

  .text-sl {
    font-size: 80upx;
  }

  .text-xsl {
    font-size: 120upx;
  }

  .text-Abc {
    text-transform: Capitalize;
  }

  .text-ABC {
    text-transform: Uppercase;
  }

  .text-abc {
    text-transform: Lowercase;
  }

  .text-price::before {
    content: "¥";
    font-size: 80%;
    margin-right: 4upx;
  }

  .text-cut {
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
  }

  .text-nowrap {
    white-space: nowrap;
  }

  .text-bold {
    font-weight: bold;
  }

  .text-center {
    text-align: center;
  }

  .text-content {
    line-height: 1.6;
  }

  .text-left {
    text-align: left;
  }

  .text-right {
    text-align: right;
  }

  .text-lettr {
    letter-spacing: 1upx;
  }

  .text-block {
    display: block;
  }

  .text-color {
    color: var(--text-color);
  }

  .hover-color {
    color: var(--hover-color);
  }

  .text-green {
    color: var(--green);
  }

  .text-orange {
    color: var(--orange);
  }

  /* tabbar */
  .menu-tabbar {
    position: fixed;
    bottom: 0;
    height: 1.33333rem;
    padding-bottom: .5rem !important;
    color: var(--text-color);
    background: var(--Highlight-background-color);
    border-top: 2upx solid var(--border-color);
  }

  .menu-tabbar .menu-inner {
    height: 1.06667rem;
    line-height: .42667rem;
  }

  .menu-tabbar .menu-icon {
    width: .58667rem;
    height: .58667rem;
    margin: 0 auto .10667rem;
  }

  @media (prefers-color-scheme: dark) {
    .menu-tabbar .menu-icon {
      -webkit-filter: brightness(0) invert(1);
      filter: brightness(0) invert(1);
    }
  }
</style>
