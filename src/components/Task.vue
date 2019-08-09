<template>
  <div id="app">
    <h1 v-html="title"></h1>
    <input v-model="newItem" v-on:keyup.enter="addNew" />
    <button @click="addNew">添加小白鼠（看我门清自摸对对胡！）</button>
    <table>
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
        <td id="col1">{{item.task_id}}</td>
        <td id="col1">{{item.task_type}}</td>
        <td id="col1">{{item.params}}</td>
        <td id="col1">{{item.create_user}}</td>
        <td id="col1">{{item.priority}}</td>
        <td id="col1">{{item.status}}</td>
        <td id="col1">{{item.SCHEDULE}}</td>
        <td id="col1">{{item.create_time}}</td>
        <td id="col1">{{item.path}}</td>
        <td id="col1">{{item.svn_path}}</td>
        <td id="col1">
        <button @click="wrongRon">诈和！</button>
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

<style>
table tr td {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

table {
  border-collapse: collapse;
      width:90%;
      table-layout: fixed;
}

th,
td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

th {
  background-color: #4caf50;
  color: white;
}

#col1 {
  overflow: hidden;    
 	text-overflow: ellipsis;
 	white-space: nowrap;
 	width: 20em;
  background-color: #934caf;
  color: white;
}

#col2 {
  width: 80px;
}
</style>