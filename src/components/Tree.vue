<template>
  <v-tree :data="treeData" show-line></v-tree>
</template>

<script>
export default {
  data() {
    return {
      treeData: [
        {
          title: "parent 1",
          expanded: true,
          selected: true,
          children: [
            {
              title: "parent 1-0",
              expanded: true,
              children: [
                {
                  title: "leaf",
                  disableCheckbox: true
                },
                {
                  title: "leaf"
                }
              ]
            },
            {
              title: "parent 1-1",
              checked: true,
              children: [
                {
                  title: "<span style='color: #08c'>sss</span>"
                }
              ]
            }
          ]
        }
      ]
    };
  }
};
</script>