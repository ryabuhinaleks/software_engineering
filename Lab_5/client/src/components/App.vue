<template>
  <div class="hello">

    <div class="container">
      <div class="row">
        <div class="col-md-6 mx-auto">
          <h1 class="text-center">Товары</h1>
          <form v-on:submit.prevent="addNewClient">	  
				<input v-model="numCl" class="form-control" placeholder="Серийный ключ">
				<input v-model="ModelCL" class="form-control" placeholder="Модель">		
				<input v-model="DescCl" class="form-control" placeholder="Описание">
				<input v-model="YearCL" class="form-control" placeholder="Выпуск">	
				<input v-model="SumCL" class="form-control" placeholder="Цена">	
				
				<button v-if="this.isEdit == false" type="submit" style="width: 100%;" class="btn btn-success btn-block  mt-3">Добавить</button>
				<button v-else type="button" v-on:click="update()" style="width: 100%;"class="btn btn-primary btn-block  mt-3" >Обновить</button>
           </form>
		____________________________________________________________</p>
          <table class="table">
            <tr v-for="(todo) in todos" v-bind:key="todo.id" v-bind:title="todo.model">
              <td class="text-left"><b>Серийный ключ: {{todo.id}}</b></br><b>Модель:</b> {{todo.model}}</br><b>Выпуск:</b> {{todo.year}}</br><b>Описание:</b> {{todo.description}}</br><b>Цена: {{todo.sum}} руб.</b></td>
			  
              <td class="text-right">
                <button v-on:click="editCl(todo.id,todo.model, todo.description, todo.year, todo.sum)" class=" btn btn-info ">Редактировать</button>
                <button v-on:click="deleteCl(todo.id)"  class=" btn btn-danger" style="margin-top: 11px;">Удалить</button>
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
        numCl: '',
		DescCl: '',	
		ModelCL: '',
		YearCL: '',
		SumCL: '',
        isEdit: false
      }
    },
    mounted() {
      this.getTasks()
    },
    methods: {
      getTasks() {
        axios.get('/apps').then(
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
        axios.post('/app',
          { id: this.numCl, model: this.ModelCL, description: this.DescCl, year:this.YearCL, sum:this.SumCL }
        ).then((res) => {
          this.numCl = ''
		  this.ModelCL = ''
		  this.YearCL = ''
		  this.SumCL = ''
		  this.DescCl = ''
          this.getTasks()
          console.log(res)
        }).catch((err) => {
          console.log(err)
        })
      },

      editCl(id, model,desc, y, sum) {
        this.numCl = id
		this.id = id
		this.ModelCL = model
		this.DescCl = desc
		this.YearCL = y
		this.SumCL = sum
        this.isEdit = true
      },

      update() {
        axios.put(`/app/${this.id}`,
          { id: this.numCl, model: this.ModelCL, description: this.DescCl, year:this.YearCL, sum:this.SumCL }
        ).then((res) => {
          this.numCl = ''
		  this.ModelCL = ''
		  this.DescCl = ''
		  this.YearCL = ''
		  this.SumCL = ''
          this.isEdit = false
          this.getTasks()
          console.log(res)
        }).catch((err) => {
          console.log(err)
        })
      },

      deleteCl(id) {
        axios.delete(`/app/${id}`
        ).then((res) => {
          this.numCl = ''
		  this.ModelCL = ''
		  this.DescCl = ''
		  this.YearCL = ''
		  this.SumCL = ''
          this.getTasks()
          console.log(res)
        }).catch((err) => {
          console.log(err)
        })
      }
    }
  }
</script>