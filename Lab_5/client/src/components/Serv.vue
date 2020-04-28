<template>
  <div class="hello">

    <div class="container">
      <div class="row">
        <div class="col-md-6 mx-auto">
          <h1 class="text-center">Таблица Services</h1>
          <form v-on:submit.prevent="addNewClient">	  
				<input v-model="nameCl" class="form-control" placeholder="Name">
				<input v-model="PriceCL" class="form-control" placeholder="Price">		
			
					<button v-if="this.isEdit == false" type="submit" style="width: 100%;">Добавить</button>
					<button v-else type="button" v-on:click="update()" style="width: 100%;">Обновить</button>
          </form>
		____________________________________________________________</p>
          <table class="table">
            <tr v-for="(todo) in todos" v-bind:key="todo.id" v-bind:title="todo.name">
              <td class="text-left">Name:{{todo.name}}</br>Price:{{todo.price}}</td>
			  
              <td class="text-right">
                <button v-on:click="editCl(todo.name,todo.price, todo.id)">Редактировать</button>
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
		PriceCL: '',
        isEdit: false
      }
    },
    mounted() {
      this.getTasks()
    },
    methods: {
      getTasks() {
        axios.get('/services').then(
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
        axios.post('/service',
          { name: this.nameCl, price: this.PriceCL }
        ).then((res) => {
          this.nameCl = ''
		  this.PriceCL = ''
          this.getTasks()
          console.log(res)
        }).catch((err) => {
          console.log(err)
        })
      },

      editCl(title, price,id) {
        this.id = id
        this.nameCl = title
		this.PriceCL = price
        this.isEdit = true
      },

      update() {
        axios.put(`/service/${this.id}`,
          { name: this.nameCl, price: this.PriceCL}
        ).then((res) => {
          this.nameCl = ''
		  this.PriceCL = ''
          this.isEdit = false
          this.getTasks()
          console.log(res)
        }).catch((err) => {
          console.log(err)
        })
      },

      deleteCl(id) {
        axios.delete(`/service/${id}`
        ).then((res) => {
          this.nameCl = ''
		  this.PriceCL = ''
          this.getTasks()
          console.log(res)
        }).catch((err) => {
          console.log(err)
        })
      }
    }
  }
</script>