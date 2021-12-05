import axios from 'axios'
import { Message } from 'element-ui'
import { saveAs } from 'file-saver'
import { getToken } from '@/utils/auth'
import { blobValidate } from "@/utils/ruoyi";

const baseURL = process.env.VUE_APP_BASE_API

export default {
  oss(ossId) {
    var url = baseURL + '/system/oss/download/' + ossId
    axios({
      method: 'get',
      url: url,
      responseType: 'blob',
      headers: { 'Authorization': 'Bearer ' + getToken() }
    }).then(async (res) => {
      const isLogin = await blobValidate(res.data);
      if (isLogin) {
        const blob = new Blob([res.data], { type: 'application/octet-stream' })
        this.saveAs(blob, decodeURI(res.headers['download-filename']))
      } else {
        Message.error('无效的会话，或者会话已过期，请重新登录。');
      }
    })
  },
  zip(url, name) {
    var url = baseURL + url
    axios({
      method: 'get',
      url: url,
      responseType: 'blob',
      headers: { 'Authorization': 'Bearer ' + getToken() }
    }).then(async (res) => {
      const isLogin = await blobValidate(res.data);
      if (isLogin) {
        const blob = new Blob([res.data], { type: 'application/zip' })
        this.saveAs(blob, name)
      } else {
        Message.error('无效的会话，或者会话已过期，请重新登录。');
      }
    })
  },
  saveAs(text, name, opts) {
    saveAs(text, name, opts);
  }
}

