enum enumPermation {
  allBranches,
  addBranch,
  editBranch,
  deleteBranch,
  productsBranch,
  leaders,
  addLeaders,
  editLeaders,
  deleteLeaders,
  groups,
  addGroup,
  editGroup,
  deleteGroup,
  products,
  addProduct,
  editProduct,
  deleteProduct,
  orders,
  addOrder,
  editOrder,
  deleteOrder,
  printOrder,
  orderDetails,
  editOrderStatus,
  editOrderDelegate,
  editOrderReceivingBranch,
  warehouseManagement,
  warehouseAccounts,
  addAndWithdrawLists,
  productList,
  showProductList,
  editProductList,
  addProductList,
  deleteProductList,
  bonds,
  addBond,
  editBond,
  deleteBond,
  financialAccounts,
  moneyRequests,
  addMoneyRequest,
  editMoneyRequest,
  deleteMoneyRequest,
  editMoneyRequestStatus,
  customers,
  addCustomer,
  editCustomer,
  deleteCustomer,
  staffs,
  addStaff,
  editStaff,
  deleteStaff,
  roles,
  addRole,
  editRole,
  deleteRole,
  settings,
  languages,
  orderStatues,
  orderMovements,
  paymentMethods,
  locations,
  clearCache,
}

extension MyIconsExtensions on enumPermation {
  String get label {
    switch (this) {
      case enumPermation.allBranches:
        return 'all_branches';
      case enumPermation.addBranch:
        return 'add_branch';
      case enumPermation.editBranch:
        return 'edit_branch';
      case enumPermation.deleteBranch:
        return 'delete_branch';
      case enumPermation.productsBranch:
        return 'products_branch';
      case enumPermation.leaders:
        return 'leaders';
      case enumPermation.addLeaders:
        return 'add_leaders';
      case enumPermation.editLeaders:
        return 'edit_leaders';
      case enumPermation.deleteLeaders:
        return 'delete_leaders';
      case enumPermation.groups:
        return 'groups';
      case enumPermation.addGroup:
        return 'add_group';
      case enumPermation.editGroup:
        return 'edit_group';
      case enumPermation.deleteGroup:
        return 'delete_group';
      case enumPermation.products:
        return 'products';
      case enumPermation.addProduct:
        return 'add_product';
      case enumPermation.editProduct:
        return 'edit_product';
      case enumPermation.deleteProduct:
        return 'delete_product';
      case enumPermation.orders:
        return 'orders';
      case enumPermation.addOrder:
        return 'add_order';
      case enumPermation.editOrder:
        return 'edit_order';
      case enumPermation.deleteOrder:
        return 'delete_order';
      case enumPermation.printOrder:
        return 'print_order';
      case enumPermation.orderDetails:
        return 'order_details';
      case enumPermation.editOrderStatus:
        return 'edit_order_status';
      case enumPermation.editOrderDelegate:
        return 'edit_order_delegate';
      case enumPermation.editOrderReceivingBranch:
        return 'edit_order_receiving_branch';
      case enumPermation.warehouseManagement:
        return 'warehouse_management';
      case enumPermation.warehouseAccounts:
        return 'warehouse_accounts';
      case enumPermation.addAndWithdrawLists:
        return 'add_and_withdraw_lists';
      case enumPermation.productList:
        return 'product_list';
      case enumPermation.showProductList:
        return 'show_product_list';
      case enumPermation.editProductList:
        return 'edit_product_list';
      case enumPermation.addProductList:
        return 'add_product_list';
      case enumPermation.deleteProductList:
        return 'delete_product_list';
      case enumPermation.bonds:
        return 'bonds';
      case enumPermation.addBond:
        return 'add_bond';
      case enumPermation.editBond:
        return 'edit_bond';
      case enumPermation.deleteBond:
        return 'delete_bond';
      case enumPermation.financialAccounts:
        return 'financial_accounts';
      case enumPermation.moneyRequests:
        return 'money_requests';
      case enumPermation.addMoneyRequest:
        return 'add_money_request';
      case enumPermation.editMoneyRequest:
        return 'edit_money_request';
      case enumPermation.deleteMoneyRequest:
        return 'delete_money_request';
      case enumPermation.editMoneyRequestStatus:
        return 'edit_money_request_status';
      case enumPermation.customers:
        return 'customers';
      case enumPermation.addCustomer:
        return 'add_customer';
      case enumPermation.editCustomer:
        return 'edit_customer';
      case enumPermation.deleteCustomer:
        return 'delete_customer';
      case enumPermation.staffs:
        return 'staffs';
      case enumPermation.addStaff:
        return 'add_staff';
      case enumPermation.editStaff:
        return 'edit_staff';
      case enumPermation.deleteStaff:
        return 'delete_staff';
      case enumPermation.roles:
        return 'roles';
      case enumPermation.addRole:
        return 'add_role';
      case enumPermation.editRole:
        return 'edit_role';
      case enumPermation.deleteRole:
        return 'delete_role';
      case enumPermation.settings:
        return 'settings';
      case enumPermation.languages:
        return 'languages';
      case enumPermation.orderStatues:
        return 'order_statues';
      case enumPermation.orderMovements:
        return 'order_movements';
      case enumPermation.paymentMethods:
        return 'payment_methods';
      case enumPermation.locations:
        return 'locations';
      case enumPermation.clearCache:
        return 'clear_cache';
    }
  }
}
