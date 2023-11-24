# frozen_string_literal: true

# class calc
class CalcController < ApplicationController
  def input; end

  def output
    arr_y = params[:val].split(' ').map(&:to_i)
    @result = []
    positive_numbers = arr_y.select(&:positive?) # Фильтруем положительные числа
    average = positive_numbers.reduce(:+).to_f / positive_numbers.size # Вычисляем среднее
    index_to_replace = arr_y.index { |x| (x % 7).zero? } # Находим индекс первого кратного 7 элемента
    @result = arr_y if index_to_replace.nil?

    return unless index_to_replace

    arr_y[index_to_replace] = average # Заменяем значение на среднее арифметическое, если такой элемент был найден
    @result = arr_y
  end
end
