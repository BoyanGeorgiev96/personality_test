import axios, { AxiosResponse } from 'axios';
import { ISignin } from './types/data';

async function loginUser(): Promise<AxiosResponse<ISignin, any>> {
    const response = await axios
      .get<ISignin>(`${global.api_host}login`,  
      { withCredentials: true }
      )
      return response;
 }

export default async function Signin():Promise<boolean> {
    const response = await loginUser();
    if (response.data && response.data.logged_in) {      
      return true;
    }
    return false;
}