GDPC                �                                                                         X   res://.godot/exported/133200997/export-3a6129a06f76c6e250ecade6e0bfd370-mutiplayer22.scn�"      &	      ���P�Km(��?ܻSg�    ,   res://.godot/global_script_class_cache.cfg  0B             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex       �      �̛�*$q�*�́        res://.godot/uid_cache.bin  F      A       f�jF��P�i���J2~�       res://GameManager.gd        �       &L�̗��c
�0;�        res://HTML_MutiplayerGTPv2.0.gd              �~z�F6W�ސ�P�       res://icon.svg  PB      �      C��=U���^Qu��U3       res://icon.svg.import    "      �       	஑9QJ�v�Wk��        res://mutiplayer22.tscn.remap   �A      i       �������̻���+       res://mutiplayerCardGPTV2.gd�+            ��>�L��Zq����       res://package.json   A      �       �=<��t�7��ػ�       res://project.binary`F      �      l{'Zs��^-��Q��$            extends Node
var Players ={}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
    extends Control

@export var Address = "127.0.0.1"
@export var port = 8910

var PLAYER_1 = 1
var PLAYER_2 = 2
var current_player_role = -1
var shared_deck = []
var player_cards = []
var opponent_cards = []

var initial_p_cards = []
var initial_o_cards = []

func is_host() -> bool:
	return multiplayer.is_server()

func _ready():
	multiplayer.peer_connected.connect(_on_peer_connected)
	multiplayer.peer_disconnected.connect(_on_peer_disconnected)
	multiplayer.connected_to_server.connect(_on_connected_to_server)
	multiplayer.connection_failed.connect(_on_connection_failed)

func _on_peer_connected(id):
	print("Peer connected:", id)
	if is_host() and shared_deck.size() > 0:
		print("Resending initial setup to newly connected peer:", id)
		setup_cards.rpc(shared_deck, initial_p_cards, initial_o_cards)

func _on_peer_disconnected(id):
	print("Peer disconnected:", id)

func _on_connected_to_server():
	print("Connected to server")

func _on_connection_failed():
	print("Connection failed")

@rpc("any_peer", "call_local")
func setup_cards(deck: Array, p_cards: Array, o_cards: Array):
	shared_deck = deck
	if is_host():
		player_cards = p_cards
		opponent_cards = o_cards
	else:
		player_cards = o_cards
		opponent_cards = p_cards

	print("Setup Complete | Current Role =", current_player_role, "| Player:", player_cards, "| Opponent:", opponent_cards)
	display_cards()

func create_deck() -> Array:
	var deck = []
	for i in range(1, 14):
		deck.append("Card " + str(i))
	return deck

func initialize_deck():
	shared_deck = create_deck()
	shared_deck.shuffle()

	initial_p_cards = shared_deck.slice(0, 3)
	initial_o_cards = shared_deck.slice(3, 7)

	print("Deck initialized on Host:", shared_deck)

	# Set up host locally
	setup_cards(shared_deck, initial_p_cards, initial_o_cards)

	# Broadcast to any clients
	setup_cards.rpc(shared_deck, initial_p_cards, initial_o_cards)

func _on_host_button_down():
	var peer = WebSocketMultiplayerPeer.new()
	var protocols = PackedStringArray(["binary", "text"])
	var err = peer.create_server(port, protocols)
	if err != OK:
		print("Cannot host:", err)
		return

	multiplayer.set_multiplayer_peer(peer)
	current_player_role = PLAYER_1
	print("Hosting as Player 1 (Role ID):", current_player_role)
	initialize_deck()

func _on_join_button_down():
	var peer = WebSocketMultiplayerPeer.new()
	# Connect to host (Replace with your server URL if hosting remotely)
	var err = peer.create_client("ws://" + Address + ":" + str(port))
	if err != OK:
		print("Failed to connect to server:", err)
		return
	multiplayer.set_multiplayer_peer(peer)
	current_player_role = PLAYER_2
	print("Joining as Player 2 (Role ID):", current_player_role)

func _on_start_game_button_down():
	# Optional start game logic
	pass

@rpc("any_peer", "call_local")
func request_card_from_host(client_role: int):
	print("request_card_from_host called. is_host():", is_host(), " client_role:", client_role)
	if is_host() and shared_deck.size() > 0:
		var drawn_card = shared_deck.pop_front()
		print("Host drawing card for client (Role: ", client_role, "):", drawn_card)
		draw_card_rpc.rpc(client_role, drawn_card)
	else:
		print("No cards left or not host!")

func _on_draw_button_pressed():
	if is_host():
		if shared_deck.size() > 0:
			var drawn_card = shared_deck.pop_front()
			print("Draw Button Pressed by Host: Sending Card", drawn_card, "From Role:", current_player_role)
			draw_card_rpc.rpc(current_player_role, drawn_card)
		else:
			print("Deck is empty!")
	else:
		print("Client requesting a card from host...")
		request_card_from_host.rpc(current_player_role)

@rpc("any_peer", "call_local")
func draw_card_rpc(drawing_role: int, drawn_card: String):
	print("RPC Called: Drawing Role =", drawing_role, "Local Role =", current_player_role, "Card =", drawn_card)

	if drawing_role == current_player_role:
		player_cards.append(drawn_card)
		print("[Current Player] Drew:", drawn_card)
	else:
		opponent_cards.append(drawn_card)
		print("[Opponent] Drew:", drawn_card)

	display_cards()

func display_cards():
	var player_card_container = $PlayerCards
	var opponent_card_container = $OpponentCards

	clear_container(player_card_container)
	clear_container(opponent_card_container)

	for card in player_cards:
		var color_rect = create_card(Color(0.2, 0.6, 1.0), "Front: " + card)
		player_card_container.add_child(color_rect)

	for card in opponent_cards:
		var color_rect = create_card(Color(1.0, 0.5, 0.5), "Back")
		opponent_card_container.add_child(color_rect)

	print("Cards Display Updated: Player =", player_cards, "Opponent =", opponent_cards)

func clear_container(container: HBoxContainer):
	for child in container.get_children():
		container.remove_child(child)
		child.queue_free()

func create_card(color: Color, text: String) -> ColorRect:
	var color_rect = ColorRect.new()
	color_rect.color = color
	color_rect.set_custom_minimum_size(Vector2(150, 200))

	var label = Label.new()
	label.text = text
	#label.horizontal_alignment = Label.HORIZONTAL_ALIGNMENT_CENTER
	#label.vertical_alignment = Label.VERTICAL_ALIGNMENT_CENTER
	label.autowrap = true

	color_rect.add_child(label)
	return color_rect
              GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[             [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://6ntelkcx1ja2"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://mutiplayerCardGPTV2.gd ��������      local://PackedScene_o1bi1          PackedScene          	         names "         Control    layout_mode    anchors_preset    offset_right    offset_bottom    script    Host    offset_left    offset_top    text    Button    Join 
   StartGame 	   LineEdit    Label    PlayerCards2    VBoxContainer    OpponentCards2    PlayerCards    HBoxContainer    OpponentCards    DrawButton    _on_host_button_down    button_down    _on_join_button_down    _on_start_game_button_down    _on_draw_button_pressed    pressed    	   variants    1                    ��D     D               B     �B     �B     �B      Host      �B     �B     1C     �B      Join      XC     �B     �C      Start Game      �B     �A     �C     HB     �A     �A     tB     <B      Name:       �C     �C    ��C    ��C           �C     D     �B    ��C     �C    ��C     �C     �C     �A     �C     xB     5C     `C    ��C     �C   
   Draw card       node_count             nodes     �   ��������        ����                                              
      ����                                 	   	               
      ����            
                     	                  
      ����                                 	                        ����                                                   ����                                 	                        ����                                                   ����             !            "      #                     ����            $      %      &      '                     ����            (      )      *      +               
      ����            ,      -      .      /   	   0             conn_count             conns                                                                                
                              node_paths              editable_instances              version             RSRC          extends Control

@export var Address = "127.0.0.1"
@export var port = 8910

var PLAYER_1 = 1
var PLAYER_2 = 2
var current_player_role = -1
var shared_deck = []
var player_cards = []
var opponent_cards = []

# Store the initial arrays from the host perspective
var initial_p_cards = []
var initial_o_cards = []

func is_host() -> bool:
	return multiplayer.is_server()
	
func _ready():
	multiplayer.peer_connected.connect(_on_peer_connected)
	multiplayer.peer_disconnected.connect(_on_peer_disconnected)
	multiplayer.connected_to_server.connect(_on_connected_to_server)
	multiplayer.connection_failed.connect(_on_connection_failed)

func _on_peer_connected(id):
	print("Peer connected:", id)
	if is_host() and shared_deck.size() > 0:
		# Resend initial setup to the newly connected peer
		print("Resending initial setup to newly connected peer:", id)
		setup_cards.rpc(shared_deck, initial_p_cards, initial_o_cards)

func _on_peer_disconnected(id):
	print("Peer disconnected:", id)

func _on_connected_to_server():
	print("Connected to server")

func _on_connection_failed():
	print("Connection failed")

@rpc("any_peer","call_local")
func setup_cards(deck: Array, p_cards: Array, o_cards: Array):
	shared_deck = deck
	
	if is_host():
		# Host sees p_cards as player_cards, o_cards as opponent_cards
		player_cards = p_cards
		opponent_cards = o_cards
	else:
		# Client sees the opposite
		player_cards = o_cards
		opponent_cards = p_cards

	print("Setup Complete | Current Role =", current_player_role, "| Player:", player_cards, "| Opponent:", opponent_cards)
	display_cards()

func create_deck() -> Array:
	var deck = []
	for i in range(1, 14):
		deck.append("Card " + str(i))
	return deck

func initialize_deck():
	shared_deck = create_deck()
	shared_deck.shuffle()

	initial_p_cards = shared_deck.slice(0, 3)
	initial_o_cards = shared_deck.slice(3, 7)

	print("Deck initialized on Host:", shared_deck)

	# First, set up host locally
	# Just call setup_cards() directly, no call_local needed.
	setup_cards(shared_deck, initial_p_cards, initial_o_cards)

	# Then broadcast to any clients
	setup_cards.rpc(shared_deck, initial_p_cards, initial_o_cards)

func _on_host_button_down():
	var peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(port, 2)
	if error != OK:
		print("Cannot host:", error)
		return

	multiplayer.set_multiplayer_peer(peer)
	current_player_role = PLAYER_1
	print("Hosting as Player 1 (Role ID):", current_player_role)
	initialize_deck()

func _on_join_button_down():
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(Address, port)
	multiplayer.set_multiplayer_peer(peer)
	current_player_role = PLAYER_2
	print("Joining as Player 2 (Role ID):", current_player_role)

func _on_start_game_button_down():
	# Optionally implement if needed
	pass

 

# This RPC is called by the client to request a card from the host.
@rpc("any_peer", "call_local")
func request_card_from_host(client_role: int):
	print("request_card_from_host called. is_host():", is_host(), " client_role:", client_role)
	if is_host() and shared_deck.size() > 0:
		var drawn_card = shared_deck.pop_front()
		print("Host drawing card for client (Role: ", client_role, "):", drawn_card)
		# Use draw_card_rpc to update both players
		draw_card_rpc.rpc(client_role, drawn_card)
	else:
		print("No cards left or not host!")

		
func _on_draw_button_pressed():
	if is_host():
		# Host draw logic remains the same
		if shared_deck.size() > 0:
			var drawn_card = shared_deck.pop_front()
			print("Draw Button Pressed by Host: Sending Card", drawn_card, "From Role:", current_player_role)
			draw_card_rpc.rpc(current_player_role, drawn_card)
		else:
			print("Deck is empty!")
	else:
		# Client requests a card from the host
		print("Client requesting a card from host...")
		request_card_from_host.rpc(current_player_role)

		
@rpc("any_peer","call_local")
func draw_card_rpc(drawing_role: int, drawn_card: String):
	print("RPC Called: Drawing Role =", drawing_role, "Local Role =", current_player_role, "Card =", drawn_card)

	if drawing_role == current_player_role:
		player_cards.append(drawn_card)
		print("[Current Player] Drew:", drawn_card)
	else:
		opponent_cards.append(drawn_card)
		print("[Opponent] Drew:", drawn_card)

	display_cards()

func display_cards():
	var player_card_container = $PlayerCards
	var opponent_card_container = $OpponentCards

	clear_container(player_card_container)
	clear_container(opponent_card_container)

	for card in player_cards:
		var color_rect = create_card(Color(0.2, 0.6, 1.0), "Front: " + card)
		player_card_container.add_child(color_rect)

	for card in opponent_cards:
		var color_rect = create_card(Color(1.0, 0.5, 0.5), "Back")
		opponent_card_container.add_child(color_rect)

	print("Cards Display Updated: Player =", player_cards, "Opponent =", opponent_cards)

func clear_container(container: HBoxContainer):
	for child in container.get_children():
		container.remove_child(child)
		child.queue_free()

func create_card(color: Color, text: String) -> ColorRect:
	var color_rect = ColorRect.new()
	color_rect.color = color
	color_rect.set_custom_minimum_size(Vector2(150, 200))

	var label = Label.new()
	label.text = text
	#label.horizontal_alignment = Label.HORIZONTAL_ALIGNMENT_CENTER
	#label.vertical_alignment = Label.VERTICAL_ALIGNMENT_CENTER
	#label.autowrap = true

	color_rect.add_child(label)
	return color_rect
              {
  "name": "godot-ws-server",
  "version": "1.0.0",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  },
  "dependencies": {
    "ws": "^8.13.0"
  }
}
         [remap]

path="res://.godot/exported/133200997/export-3a6129a06f76c6e250ecade6e0bfd370-mutiplayer22.scn"
       list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             ?h+'��   res://icon.svg����&/�   res://mutiplayer22.tscn               ECFG      application/config/name          cardGame Test Mutiplayer   application/config/features(   "         4.1    GL Compatibility       application/config/icon         res://icon.svg     autoload/GameManager          *res://GameManager.gd   #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility4   rendering/textures/vram_compression/import_etc2_astc                   