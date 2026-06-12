# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @notes = Note.accessible_by(Current.ability).unhidden
    @note = Note.new
    @urgents = Urgent.active.unhidden.ordered_by_created_at if Current.user&.scc?
  end
end
