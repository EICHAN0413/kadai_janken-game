class Player
  def hand
    p "数字を入力してください。"
    p "[0]:グー, [1]:チョキ, [2]:パー"
    input_hand = gets
    while true do
       if input_hand.include?("0") || input_hand.include?("1") || input_hand.include?("2")
         input = input_hand.to_i
        return input
       else
        puts "0~2の数字を入力してください"
        puts "0:グー, 1:チョキ, 2:パー"
        input_hand = gets
      end
    end
  end
end

class Enemy
  def hand
    enemy_hand = rand(3)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]
    puts "相手の手は#{janken[enemy_hand]}です。"
     if player_hand == enemy_hand
      puts "あいこ"
      return true
     elsif (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand ==2) || (player_hand ==2 && enemy_hand == 0)
      puts "あなたの勝ちです"
      return false
     else
      puts "あなたの負けです"
      return false
    end
  end
end

class GameStart
    def self.jankenpon
    player = Player.new
    enemy = Enemy.new
    janken = Janken.new
    next_game = true
    while next_game do
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end

GameStart.jankenpon
