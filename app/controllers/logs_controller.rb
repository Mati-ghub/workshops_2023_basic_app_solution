class LogsController < ApplicationController

  def index
    @logs = FetchLogsFromSideApp.get_logs
  end
end
