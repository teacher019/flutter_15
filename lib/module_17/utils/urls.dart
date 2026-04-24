
class Urls{
  static String baseURL  = 'https://jsonplaceholder.typicode.com/';
  static String getPost = '$baseURL/posts';
  static String createPost = '$baseURL/posts';
  static String deletePost(String id) => '$baseURL/posts/$id';

}