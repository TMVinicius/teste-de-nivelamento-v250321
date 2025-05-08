<template>
  <div>
    <input v-model="searchQuery" @input="fetchData" placeholder="Buscar empresa" />
    <ul>
      <li v-for="empresa in empresas" :key="empresa.cnpj">
        - Razão Social: <strong>{{ empresa.razao_social }}</strong> - CNPJ: {{ empresa.cnpj }}
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      searchQuery: '',
      empresas: []
    };
  },
  methods: {
    async fetchData() {
      if (this.searchQuery.length > 2) {
        try {
          const response = await axios.get(`http://localhost:5000/pesquisar?q=${this.searchQuery}`);
          this.empresas = response.data;
        } catch (error) {
          console.error('Erro ao buscar empresas:', error);
        }
      } else {
        this.empresas = [];
      }
    }
  }
};
</script>
