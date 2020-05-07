
<template>
  <div class="hello">

    <div class="container">
      <div class="row">
        <div class="col-md-6 mx-auto">
          <h1 class="text-center">Клиенты</h1>
          <form v-on:submit.prevent="addNewClient">	  
				<input v-model="nameCl" class="form-control" placeholder="Название компании">
				<input v-model="ScoreCL" class="form-control" placeholder="Лицевой счет">		
				<input v-model="CityCL" class="form-control" placeholder="Город">	
				<input v-model="TelephoneCL" class="form-control" placeholder="Телефон">
			
				
				<button v-if="this.isEdit == false" type="submit" style="width: 100%;" class="btn btn-success btn-block  mt-3">Добавить</button>
				<button v-else type="button" v-on:click="update()" style="width: 100%;"class="btn btn-primary btn-block  mt-3" >Обновить</button>
          </form>
		____________________________________________________________</p>
          <table class="table">
            <tr v-for="(todo) in todos" v-bind:key="todo.id" v-bind:title="todo.name">
              <td class="text-left">Название: <b>{{todo.name}}</b></br>Счет: {{todo.score}}</br>Город:{{todo.city}}</br>Телефон:{{todo.telephone}}</td>
			  
              <td class="text-right">
                <button v-on:click="editCl(todo.name,todo.score, todo.city,todo.telephone,todo.id)"  class=" btn btn-info ">Редактировать</button>
                <button v-on:click="deleteCl(todo.id)" class=" btn btn-danger ">Удалить</button>
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
		ScoreCL: '',
		CityCL: '',
        isEdit: false,
		users:[]
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
          { name: this.nameCl, score: this.ScoreCL, city: this.CityCL, telephone:this.TelephoneCL }
        ).then((res) => {
          this.nameCl = ''
		  this.ScoreCL = ''
		  this.CityCL = ''
		  this.TelephoneCL = ''
          this.getTasks()
          console.log(res)
        }).catch((err) => {
          console.log(err)
        })
      },

      editCl(title, score,city,telephone,id) {
        this.id = id
        this.nameCl = title
		this.ScoreCL = score
		this.CityCL=city
		this.TelephoneCL=telephone
        this.isEdit = true
      },

      update() {
        axios.put(`/client/${this.id}`,
          { name: this.nameCl, score: this.ScoreCL, city: this.CityCL, telephone:this.TelephoneCL }
        ).then((res) => {
          this.nameCl = ''
		  this.ScoreCL = ''
		  this.CityCL = ''
		  this.TelephoneCL = ''
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
		  this.ScoreCL = ''
		  this.CityCL = ''
		  this.TelephoneCL = ''
          this.getTasks()
          console.log(res)
        }).catch((err) => {
          console.log(err)
        })
      }
    }
  }
</script>