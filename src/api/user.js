import { api_url, getEndpoint, updateEndpoint } from '../utils'


export async function readUser(id) {
    const url = api_url + `/users/${id}/`
    return await getEndpoint(url)
}

export async function updateUser(id, username, email, firstname, lastname) {
    const url = api_url + `/users/${id}/`
    let body = {
        username: username,
        email: email,
        first_name: firstname,
        last_name: lastname
    }
    return await updateEndpoint(url, 'put', body)
}

export async function deleteUser(id) {
    const url = api_url + `/users/${id}/`
    return await updateEndpoint(url, 'delete', {})
}