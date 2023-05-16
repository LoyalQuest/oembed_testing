class TestOneJob < ApplicationJob
  queue_as :default


  def perform
    arr = %w[stayfolio hand curation tuna yes no style stash]
    sorted_arr = arr.uniq.sort_by { |element| [element.length] }
  end
end
