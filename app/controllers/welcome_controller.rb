# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @notes = Note.accessible_by(Current.ability).unhidden
    @note = Note.new
    return unless Current.user&.scc?

    @urgents = Urgent.active.unhidden.ordered_by_created_at
  end
end
