require_dependency "subscribem/application_controller"

module Subscribem
  class AccountsController < ApplicationController
    #sign_up form and new account
    def new
      @account = Subscribem::Account.new
    end

    #create new account
    def create
      account = Subscribem::Account.create(accounts_params)
      flash[:success] = "Your account has been successfully created."
      redirect_to subscribem.root_url
    end

    private

    #definestrong parameters for account
    def accounts_params
      params.require(:account).permit(:name)
    end
  end
end
