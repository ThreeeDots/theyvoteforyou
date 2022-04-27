# frozen_string_literal: true

class WikiMotion < ApplicationRecord
  belongs_to :user
  belongs_to :division

  validates :title, :description, presence: true

  attr_writer :title, :description

  before_save :set_text_body, unless: :text_body
  after_create do
    alert_policy_watches
    division.reindex
  end

  def previous_edit
    division.wiki_motions.find_by("created_at < ?", created_at)
  end

  def title
    @title ||= text_body[/--- DIVISION TITLE ---(.*)--- MOTION EFFECT/m, 1]
  end

  def description
    @description ||= text_body[/--- MOTION EFFECT ---(.*)--- COMMENT/m, 1]
  end

  def previous_description
    if previous_edit
      previous_edit.description
    else
      division.original_motion
    end
  end

  def previous_title
    if previous_edit
      previous_edit.title
    else
      division.original_name
    end
  end

  private

  def set_text_body
    self.text_body = <<~RECORD
            --- DIVISION TITLE ---
      #{'      '}
            #{title}
      #{'      '}
            --- MOTION EFFECT ---
      #{'      '}
            #{description}
      #{'      '}
            --- COMMENTS AND NOTES ---
      #{'      '}
            (put thoughts and notes for other researchers here)
    RECORD
  end

  def alert_policy_watches
    division.policies.each do |policy|
      policy.alert_watches(self)
    end
  end
end
