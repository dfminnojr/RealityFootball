
app.controller('UserListCtrl', function($scope, User) {
  $scope.users = User.query()
  $scope.selectedUser = null

  $scope.showUser = function(user){
    $scope.selectedUser = user;
  }
});