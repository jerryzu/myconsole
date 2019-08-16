<template>
  <div id="app">
    <div>
      <Form :model="formItem" ref="formItem" :rules="ruleInline" :label-width="80">
        <button @click="doSearch">查询</button>
        <FormItem label="完成状态 : " prop="sendValue">
          <Select style="width:200px" v-model="formItem.sendValue">
            <Option
              v-for="item in formItem.stateList"
              :value="item.value"
              :key="item.value"
              name="sendValue"
            >
              {{
              item.label }}
            </Option>
          </Select>
        </FormItem>
      </Form>
    </div>
    <h1 v-html="title"></h1>
    <input v-model="status1" v-on:keyup.enter="doSearch" />
    <Select v-model="status" style="width:200px">
      <option disabled>请选择</option>
      <Option value="0">notReady</Option>
      <Option value="1">ready</Option>
      <Option value="2">running</Option>
      <Option value="3">fail</Option>
      <Option value="4">succ</Option>
      <Option value="5">autoSucc</Option>
    </Select>
    <button @click="doSearch">查询</button>
    <table>
      <tr>
        <td>执行ID</td>
        <td>任务ID</td>
        <td>业务日期</td>
        <td>任务类型</td>

        <td>调度方式</td>
        <td>参数</td>
        <td>创建人</td>
        <td>优先级</td>
        <td>任务状态</td>
        <td>定时</td>
        <td>创建日期</td>
        <td>任务开始时间</td>
        <td>任务结束时间</td>
        <td>任务路径</td>
        <td>SVN地址</td>
      </tr>
      <tr v-for="(item,index) in items" :key="index">
        <td id="col1">{{item.action_id}}</td>
        <td id="col1">{{item.task_id}}</td>
        <td id="col1">{{item.biz_date}}</td>
        <td id="col1">{{item.task_type}}</td>

        <td id="col1">{{item.schedule_flag}}</td>
        <td id="col1">{{item.params}}</td>
        <td id="col1">{{item.create_user}}</td>
        <td id="col1">{{item.priority}}</td>

        <td id="col1">{{item.status}}</td>
        <td id="col1">{{item.schedule}}</td>

        <td id="col1">{{item.create_time}}</td>
        <td id="col1">{{item.start_time}}</td>
        <td id="col1">{{item.end_time}}</td>
        <td id="col1">{{item.path}}</td>
        <td id="col1">{{item.svn_path}}</td>
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
      status: 5,
      status1: 51,
      formItem: {
        d_title: "",
        u_phone: "",

        stateList: [
          {
            value: "0",
            label: "待分配"
          },
          {
            value: "1",
            label: "开发中"
          },
          {
            value: "2",
            label: "已完成"
          },
          {
            value: "3",
            label: "停用"
          },
          {
            value: "4",
            label: "已变更"
          }
        ]
      }
    };
  },
  mounted() {
    const ActionUrl = "/api/action/selecttoday";
    this.axios
      .get(ActionUrl)
      .then(res => {
        this.items = res.data;
      })
      .catch(error => {
        console.log(error);
      });
  },
  methods: {
    doSearch: function() {
      let d_status = this.formItem.sendValue;
      console.log("中国");
      console.log(d_status);

      let ActionUrl = "/api/action/selecttoday";
      console.log(this.status);
      if (this.status != "") {
        ActionUrl = ActionUrl + "?status=" + this.status;
      }

      this.axios
        .get(ActionUrl)
        .then(res => {
          this.items = res.data;
        })
        .catch(error => {
          console.log(error);
        });
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
  width: 90%;
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
  background-color: #f6f2f8;
  color: black;
}

#col2 {
  width: 80px;
}
</style>