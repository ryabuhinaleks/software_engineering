<template>
  <div class="hello">

    <div class="container">
      <div class="row">
        <div class="col-md-6 mx-auto">
          <h1 class="text-center">Таблица Clients</h1>
          <form v-on:submit.prevent="addNewClient">	  
				<input v-model="nameCl" class="form-control" placeholder="Name">
				<input v-model="DataCL" class="form-control" placeholder="Data">		
			
					<button v-if="this.isEdit == false" type="submit" style="width: 100%;">Добавить</button>
					<button v-else type="button" v-on:click="update()" style="width: 100%;">Обновить</button>
          </form>
		____________________________________________________________</p>
          <table class="table">
            <tr v-for="(todo) in todos" v-bind:key="todo.id" v-bind:title="todo.name">
              <td class="text-left">Name:{{todo.name}}</br>Data:{{todo.data}}</td>
			  
              <td class="text-right">
                <button v-on:click="editCl(todo.name,todo.data, todo.id)">Редактировать</button>
                <button v-on:click="deleteCl(todo.id)" >Удалить</button>
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    data() {
      return {
        todos: [],
        id: '',
        nameCl: '',
		DataCL: '',
        isEdit: false
      }
    },
    mounted() {
      this.getTasks()
    },
    methods: {
      getTasks() {
        axios.get('/clients').then(
          result => {
            console.log(result.data)
            this.todos = result.data
          },
          error => {
            console.error(error)
          }
        )
      },
      addNewClient() {
        axios.post('/client',
          { name: this.nameCl, data: this.DataCL }
        ).then((res) => {
          this.nameCl = ''
		  this.DataCL = ''
          this.getTasks()
          console.log(res)
        }).catch((err) => {
          console.log(err)
        })
      },

      editCl(title, dataa,id) {
        this.id = id
        this.nameCl = title
		this.DataCL = dataa
        this.isEdit = true
      },

      update() {
        axios.put(`/client/${this.id}`,
          { name: this.nameCl, data: this.DataCL}
        ).then((res) => {
          this.nameCl = ''
		  this.DataCL = ''
          this.isEdit = false
          this.getTasks()
          console.log(res)
        }).catch((err) => {
          console.log(err)
        })
      },

      deleteCl(id) {
        axios.delete(`/client/${id}`
        ).then((res) => {
          this.nameCl = ''
		  		  this.DataCL = ''

          this.getTasks()
          console.log(res)
        }).catch((err) => {
          console.log(err)
        })
      }
    }
  }
</script>