<template>
  <div class="hello">

    <div class="container">
      <div class="row">
        <div class="col-md-6 mx-auto">
          <h1 class="text-center">Услуги</h1>
          <form v-on:submit.prevent="addNewService">	  
				<select v-model="ClientCl" class="form-control">
					<option disabled value="n">Клиент</option>
					<option v-for="user in users" v-bind:value="user.id">{{user.name}}</option>
				</select>
				<input v-model="DateCL" class="form-control" type=date>		
				
				<select v-model="NumberCL" class="form-control">
					<option disabled value="n1">Серийный номер</option>
					<option v-for="t in tovar" v-bind:value="t.id">{{t.model}}</option>
				</select>

				<input v-model="CountCL" class="form-control" placeholder="Количество" type=number>
		
		
				<button v-if="this.isEdit == false" type="submit" style="width: 100%;" class="btn btn-success btn-block  mt-3">Добавить</button>
				<button v-else type="button" v-on:click="update()" style="width: 100%;"class="btn btn-primary btn-block  mt-3" >Обновить</button>
          </form>
		  ____________________________________________________________</p>


          <table class="table">
            <tr v-for="(todo) in todos" v-bind:key="todo.id" v-bind:title="todo.name">
				<td v-for="(us) in NameUser" v-if="us.id==todo.id_client" class="text-left">Клиент: <b>{{us.name}}</b></br>Дата:<b> {{todo.date}}</b></br>
				<span v-for="(t) in tovar" v-bind:key="t.id"  v-if="t.id==todo.number">
					Серийн.номер: <b>{{todo.number}}</b></br>
					Товар: <b>{{t.model}}</b>
				</span>
				</br>Кол-во: {{todo.count}}</td>
			 
              <td class="text-right">
                <button v-on:click="editCl(todo.id_client,todo.date, todo.number,todo.count,todo.id)" class="btn btn-info">Редактировать</button>
                <button v-on:click="deleteCl(todo.id)" class=" btn btn-danger " style="margin-top:11px">Удалить</button>
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
        ClientCl: '',
		DateCL: '',
		CountCL: '',
		NumberCL: '',
		users:[],
		tovar:[],
		NameUser: [],
        isEdit: false
      }
    },
    mounted() {
      this.getTasks()
	  this.getUsers()
	  this.getUserName()
	  this.getTovarName()
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

	  getUsers() {
        axios.get('/users').then(
          result => {
            console.log(result.data)
            this.users = result.data
          },
          error => {
            console.error(error)
          }
        )
      },
	  	  
	  getUserName() 
	  {
        axios.get(`/user`)
		.then(
				result => 
				{
					this.ClientCl='n'
					this.NameUser = result.data
				},
		).catch((err) => {
          console.log(err)
        })
      },
	  
	  getTovarName() 
	  {
        axios.get(`/tovar`)
		.then(
				result => 
				{
					this.NumberCL='n1'
					this.tovar = result.data
				},
		).catch((err) => {
          console.log(err)
        })
      },
	  
      addNewService() {
        axios.post('/service',
          { date: this.DateCL,id_client: this.ClientCl, number:this.NumberCL, count:this.CountCL}
        ).then((res) => {
          this.ClientCl='n'
		  this.NumberCL='n1'
		  this.DateCL = ''
		  this.CountCL = '' 
          this.getTasks()
          console.log(res)
        }).catch((err) => {
          console.log(err)
        })
      },

      editCl(client, date, num,count,id) {
        this.id = id
        this.ClientCl = client
		this.DateCL = date
		this.CountCL=count
		this.NumberCL = num
        this.isEdit = true
      },

      update() {
        axios.put(`/service/${this.id}`,
          { id_client: this.ClientCl, date: this.DateCL, number: this.NumberCL, count:this.CountCL}
        ).then((res) => {
		  this.CountCL = ''
		  this.ClientCl='n'
		  this.NumberCL='n1'
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
          this.ClientCl='n'
		  this.NumberCL='n1'
		  this.DateCL = ''
		  this.CountCL = ''
          this.getTasks()
          console.log(res)
        }).catch((err) => {
          console.log(err)
        })
      }
    }
  }
</script>