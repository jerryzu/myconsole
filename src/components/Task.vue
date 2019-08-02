<template>
  <div id="app">
    <h1 v-html="title"></h1>
    <input v-model="newItem" v-on:keyup.enter="addNew" />
    <button @click="addNew">添加小白鼠（看我门清自摸对对胡！）</button>
    <table class="scoreTable">
      <tr>
        <td>任务ID</td>
        <td>任务类型</td>
        <td>参数</td>
        <td>创建人</td>
        <td>优先级</td>

        <td>任务状态</td>
        <td>定时</td>
        <td>创建日期</td>
        <td>任务路径</td>
        <td>SVN地址</td>

        <td>操作</td>
      </tr>
      <tr v-for="(item,index) in items" :key="index">
        <td>{{item.task_id}}</td>
        <td>{{item.task_type}}</td>
        <td>{{item.params}}</td>
        <td>{{item.create_user}}</td>
        <td>{{item.priority}}</td>

        <td>{{item.status}}</td>
        <td>{{item.SCHEDULE}}</td>
        <td>{{item.create_time}}</td>
        <td>{{item.path}}</td>
        <td>{{item.svn_path}}</td>
        <td>
          <button @click="wrongRon">诈和大法好！</button>
        </td>
      </tr>
    </table>
  </div>
</template>
 
<script>
export default {
  data: function() {
    return {
      title: "太平科技保险数据调度系统",
      items: [],
      newItem: ""
    };
  },
  mounted() {
    const ListCateUrl = "/api/task/selectall";
    this.axios
      .get(ListCateUrl)
      .then(res => {
        console.log(res.data);
        this.items = res.data;
      })
      .catch(error => {
        console.log(error);
      });
  },
  methods: {
    addNew: function() {
      if (this.newItem != "") {
        this.items.push({
          name: this.newItem,
          score: 0,
          topNum: 0
        });
      }
      this.newItem = "";
    },
    wrongRon: function() {
      //this.items[index].score -= 30
    }
  }
};
</script>