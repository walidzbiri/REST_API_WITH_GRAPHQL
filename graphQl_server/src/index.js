// the entry point for my GraphQL server
const {GraphQLServer}=require('graphql-yoga');
const { prisma } = require('./generated/prisma-client')
const fetch = require('node-fetch')
const axios=require('axios');

const typeDefs= `
    scalar DateTime
    type Query {
        users: [User!]
        user(id: ID!): User
        messages(UserId: ID!): [Message!]
        message(id: ID!,UserId: ID!): Message
        comments(UserId: ID!,MessageId: ID!): [Comment!]
        comment(UserId: ID!,MessageId: ID!,id: ID!): Comment
        login(username: String!,password: String!): String
    }
    type User {
        id: ID!
        name: String!
        age: Int!
        email: String!
        createdAt: DateTime!
        updatedAt: DateTime!
    }
    type Message {
        id: ID!
        contenu: String!
        UserId: ID!
    }
    type Comment {
        id: ID!
        contenu: String!
        UserId: ID!
        MessageId: ID!
    }
    type Admin {
        id: ID!
        username: String!
        password: String!
    }
    type Share {
        id: ID!
        UserId: ID!
        MessageId: ID!
    }
    type Like {
        id: ID!
        UserId: ID!
        MessageId: ID!
    }
    type Mutation {
        createUser(name: String!, age: Int!, email: String!): User!
        deleteUser(id: ID!): ID
        updateUser(id: ID!,name: String!,age: Int!,email: String!): ID
        createMessage(contenu: String!, UserId: ID!): Message
        deleteMessage(id: ID!,UserId: ID!): ID
        updateMessage(id: ID!,contenu: String!, UserId: ID!): ID
        createComment(contenu: String!, UserId: ID!,MessageId: ID!): Comment
        deleteComment(id: ID!, UserId: ID!,MessageId: ID!): ID
        updateComment(id: ID!,contenu: String!, UserId: ID!,MessageId: ID!): ID
        createShare(UserId: ID!,MessageId: ID!): Share
        deleteShare(id: ID!, UserId: ID!, MessageId: ID!): ID
        createLike(UserId: ID!,MessageId: ID!): Like
        deleteLike(id: ID!, UserId: ID!, MessageId: ID!): ID
        signup(username: String!,password: String!): String!
    }
`
//conccurent
const baseURL="http://localhost:3000"
//2
const resolvers={
    Query: {
        users:()=> {
            return fetch(`${baseURL}/users/`).then(res => res.json())
            .then(body =>body.users);
        },
        user: (root, args) => {
            return fetch(`${baseURL}/users/${args.id}`).then(res => res.json())
            .then(body =>body.user[0]);
        },
        messages:(root,args)=> {
            return fetch(`${baseURL}/users/${args.UserId}/messages`).then(res => res.json())
            .then(body => body.data);
        },
        message:(root,args)=> {
            return fetch(`${baseURL}/users/${args.UserId}/messages/${args.id}`).then(res => res.json())
            .then(body => body.data[0]);
        },
        comments:(root,args)=> {
            return fetch(`${baseURL}/users/${args.UserId}/messages/${args.MessageId}/comments`).then(res => res.json())
            .then(body => body.data);
        },
        comment:(root,args)=> {
            return fetch(`${baseURL}/users/${args.UserId}/messages/${args.MessageId}/comments/${args.id}`).then(res => res.json())
            .then(body => body.data[0]);
        },
        login:(root,args)=>{
            var body={username:args.username,password:args.password};
            return fetch(`${baseURL}/admins/login`, { method: 'POST',headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              }, body: JSON.stringify(body) })
                    .then(res => res.json()) // expecting a json response
                    .then(json => json.admin);
        }
    },
    Mutation:{
        createUser:(root,args)=>{
            var body={age:args.age,name:args.name,email:args.email};
            return fetch(`${baseURL}/users`, { method: 'POST',headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              }, body: JSON.stringify(body) })
                    .then(res => res.json()) // expecting a json response
                    .then(json => json.data);
        },
        deleteUser:(root,args)=>{
            return fetch(`${baseURL}/users/${args.id}`, { method: 'DELETE',headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              }})
                    .then(res => res.json()) // expecting a json response
                    .then(json => {console.log(json.user);return json.user});
        },
        updateUser:(root,args)=>{
            var body={contenu:args.contenu,id:args.id,UserId:args.UserId};
            return fetch(`${baseURL}/users/${args.id}/messages/${args.id}`, { method: 'PUT',headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              },body: JSON.stringify(body) })
                    .then(res => res.json()) // expecting a json response
                    .then(json => {console.log(json.user[0]);return json.user[0]});
        },
        createMessage:(root,args)=>{
            var body={contenu:args.contenu,user_id:args.UserId};
            return fetch(`${baseURL}/users/${args.UserId}/messages/`, { method: 'POST',headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              }, body: JSON.stringify(body) })
                    .then(res => res.json()) // expecting a json response
                    .then(json =>json.message);
        },
        deleteMessage:(root,args)=>{
            return fetch(`${baseURL}/users/${args.UserId}/messages/${args.id}`, { method: 'DELETE',headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              }})
                    .then(res => res.json()) // expecting a json response
                    .then(json => json.message);
        },
        updateMessage:(root,args)=>{
            var body={contenu:args.contenu};
            return fetch(`${baseURL}/users/${args.UserId}/messages/${args.id}`, { method: 'PUT',headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              },body: JSON.stringify(body) })
                    .then(res => res.json()) // expecting a json response
                    .then(json => json.message);
        },
        createComment:(root,args)=>{
            var body={contenu:args.contenu};
            return fetch(`${baseURL}/users/${args.UserId}/messages/${args.MessageId}/comments`, { method: 'POST',headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              }, body: JSON.stringify(body) })
                    .then(res => res.json()) // expecting a json response
                    .then(json =>json.comment);
        },
        deleteComment:(root,args)=>{
            return fetch(`${baseURL}/users/${args.UserId}/messages/${args.MessageId}/comments/${args.id}`, { method: 'DELETE',headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              }})
                    .then(res => res.json()) // expecting a json response
                    .then(json => json.comment);
        },
        updateComment:(root,args)=>{
            var body={contenu:args.contenu};
            return fetch(`${baseURL}/users/${args.UserId}/messages/${args.MessageId}/comments/${args.id}`, { method: 'PUT',headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              },body: JSON.stringify(body) })
                    .then(res => res.json()) // expecting a json response
                    .then(json => json.comment);
        },
        createShare:(root,args)=>{
            return fetch(`${baseURL}/users/${args.UserId}/messages/${args.MessageId}/shares`, { method: 'POST',headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              }})
                    .then(res => res.json()) // expecting a json response
                    .then(json =>json.share);
        },
        deleteShare:(root,args)=>{
            return fetch(`${baseURL}/users/${args.UserId}/messages/${args.MessageId}/shares/${args.id}`, { method: 'DELETE',headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              }})
                    .then(res => res.json()) // expecting a json response
                    .then(json => json.share);
        },
        createLike:(root,args)=>{
            return fetch(`${baseURL}/users/${args.UserId}/messages/${args.MessageId}/likes`, { method: 'POST',headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              }})
                    .then(res => res.json()) // expecting a json response
                    .then(json =>json.like);
        },
        deleteLike:(root,args)=>{
            return fetch(`${baseURL}/users/${args.UserId}/messages/${args.MessageId}/likes/${args.id}`, { method: 'DELETE',headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              }})
                    .then(res => res.json()) // expecting a json response
                    .then(json => json.like);
        },
        signup:(root,args)=>{
            var body={username:args.username,password:args.password};
            return fetch(`${baseURL}/admins/signup`, { method: 'POST',headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              }, body: JSON.stringify(body) })
                    .then(res => res.json()) // expecting a json response
                    .then(json => json.admin);
        }
    },
    User: {
        id: (parent)=>parent.id,
        name: (parent)=>parent.name,
        age: (parent)=>parent.age,
        email: (parent)=>parent.email,
        createdAt: (parent)=>parent.createdAt,
        updatedAt: (parent)=>parent.updatedAt
    },
    Admin: {
        id: (parent)=>parent.id,
        username: (parent)=>parent.username,
        password: (parent)=>parent.password
    },
    Message: {
        id: (parent)=>parent.id,
        contenu: (parent)=>parent.contenu,
        UserId: (parent)=>parent.UserId
    },
    Comment: {
        id: (parent)=>parent.id,
        contenu: (parent)=>parent.contenu,
        UserId: (parent)=>parent.UserId,
        MessageId: (parent)=>parent.MessageId
    },
    Share: {
        id: (parent)=>parent.id,
        UserId: (parent)=>parent.UserId,
        MessageId: (parent)=>parent.MessageId
    },
    Like: {
        id: (parent)=>parent.id,
        UserId: (parent)=>parent.UserId,
        MessageId: (parent)=>parent.MessageId
    }
}

//3
const server=new GraphQLServer({
    typeDefs,
    resolvers
})
server.start(()=> console.log("Server is runnig on port 4000"));