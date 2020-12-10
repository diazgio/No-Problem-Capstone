# frozen_string_literal: true

json.array! @problems, partial: 'problems/problem', as: :problem
