<template>
  <div class="tabs">
    <div class="tab" @click="toggleTab('prince')">
      <a>小王子</a>
    </div>
    <div class="tab" @click="toggleTab('rose')">
      <a>小玫瑰</a>
    </div>
    <div class="tab" @click="toggleTab('fox')">
      <a>小狐狸</a>
    </div>
  </div>
  <prince :is="currentTab" keep-alive></prince>
</template>
 
<script>
// 每一个 tab 绑定了一个点击事件，传入的参数对应着 tab 下的组件名
// 子组件，显示不同的 tab
// is 特性动态绑定子组件
// keep-alive 将切换出去的组件保留在内存中

// 引入子组件
import prince from "./components/prince";
import rose from "./components/rose";
import fox from "./components/fox";
export default {
  name: "app",
  data() {
    return {
      currentTab: "prince" // currentTab 用于标识当前触发的子组件
    };
  },
  components: {
    // 声明子组件
    prince,
    rose,
    fox
  },
  methods: {
    toggleTab: function(tab) {
      this.currentTab = tab; // tab 为当前触发标签页的组件名
    }
  }
};
</script>