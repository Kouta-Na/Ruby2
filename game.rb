
puts "じゃんけん..."
voice_type = 0
loop{
  puts "0(グー)1(チョキ)2(パー)3(戦わない)"
  hand = gets.chomp.to_i

  #選択肢の中から選ぶまで
  while hand != 0 && hand != 1 && hand != 2 && hand != 3
    puts "0(グー)1(チョキ)2(パー)3(戦わない)から選択してください"
    hand = gets.chomp.to_i
  end
  
  #じゃんけん開始
  if hand == 3 
    puts "戦いません"
    break

  else
    if voice_type == 0
      puts "ホイ！"
    elsif voice_type == 1
      puts "ショ！"
    end
    puts "-----------------"
    #自分
    case hand
    when 0
      puts "あなた；グーを出しました"
    when 1
      puts "あなた；チョキを出しました"
    when 2
      puts "あなた；パーを出しました"
    end
    #相手
    #相手の選択をランダムで生成
    enemy_hand = rand(3)
    case enemy_hand
    when 0
      puts "相手；グーを出しました"
    when 1
      puts "相手；チョキを出しました"
    when 2
      puts "相手；パーを出しました"
    end
    puts "-----------------"
  
    #じゃんけん
    class Battle1
      def initialize(hand, enemy_hand)
        @hand = hand
        @enemy_hand = enemy_hand
      end
    
      def round1
        if @hand == @enemy_hand
          puts "あいこで..."
          return 1
        else
          puts "あっち向いて〜"
          puts "0(上)1(下)2(右)3(左)"
          
          #自分
          @@arrow = gets.chomp.to_i
  
          #選択肢の中から選ぶまで
          while @@arrow != 0 && @@arrow != 1 && @@arrow != 2 && @@arrow != 3
            puts "0(上)1(下)2(右)3(左)から選択してください"
            @@arrow = gets.chomp.to_i
          end
          #相手の選択をランダムで生成
          @@enemy_arrow = rand(4)

          if (@hand == 0 && @enemy_hand == 1 ) ||
            (@hand == 1 && @enemy_hand == 2 ) ||
            (@hand == 2 && @enemy_hand == 0 )

            #自分が勝ちの場合
            return 2 

          else
            #相手が勝ちの場合
            return 3
          end
    
        end
    
      end
    
    end
  
    battle1 = Battle1.new(hand, enemy_hand)
    result_battle1 = battle1.round1()
    if result_battle1 == 1
      voice_type = 1
      next
    else
      voice_type = 0
    end
  
    #あっち向いてホイ
    class Battle2 < Battle1
      def round2(result_battle1)
        puts "-----------------"
        #自分
        case @@arrow
        when 0
          puts "あなた；上"
        when 1
          puts "あなた；下"
        when 2
          puts "あなた；右"
        when 3
          puts "あなた；左"
        end
        #相手
        case @@enemy_arrow
        when 0
          puts "相手；上"
        when 1
          puts "相手；下"
        when 2
          puts "相手；右"
        when 3
          puts "相手；左"
        end
        puts "-----------------"

        #結果
        if @@arrow == @@enemy_arrow
          if result_battle1 == 2
            puts "勝ち"
          elsif result_battle1 == 3
            puts "負け"
          end
          return 1
  
        else
          puts "じゃんけん..."
          return 2
        end
      end
    end
  
    battle2 = Battle2.new(hand, enemy_hand)
    result_battle2 = battle2.round2(result_battle1)
    if result_battle2 == 1
      break
    elsif result_battle2 == 1
      next
    end

  end
}






