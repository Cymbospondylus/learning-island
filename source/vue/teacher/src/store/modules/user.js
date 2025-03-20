import Cookies from 'js-cookie'
import userApi from '@/api/user'
// initial state
const state = {
  userName: Cookies.get('adminUserName'),
  userInfo: Cookies.get('adminUserInfo'),
  role: Cookies.get('role')
}

// actions
const actions = {
  initUserInfo ({ commit }) {
    userApi.getCurrentUser().then(re => {
      commit('setUserInfo', re.response)
    })
  }
}

// mutations
const mutations = {
  setUserName (state, userName) {
    state.userName = userName
    Cookies.set('adminUserName', userName, { expires: 30 })
  },

  setRole (state, role) {
    state.role = role
    localStorage.setItem('role', role)
  },
  clearLogin (state) {
    Cookies.remove('adminUserName')
    Cookies.remove('adminUserInfo')
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
