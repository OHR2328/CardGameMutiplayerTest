GDPC                �                                                                         X   res://.godot/exported/133200997/export-3a6129a06f76c6e250ecade6e0bfd370-mutiplayer22.scn`;      %	      M�(�a�uv7�3>�p    X   res://.godot/exported/133200997/export-ef6d63c598694e877a9a7c9e44b684b3-node_2dtest.scn pa      g      ���慓5��5��    ,   res://.godot/global_script_class_cache.cfg   k             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�-      �      �̛�*$q�*�́        res://.godot/uid_cache.bin   o      c       �4�A��L�\R�Ӏe�       res://GameManager.gdP      �       &L�̗��c
�0;�        res://HTML_MutiplayerGTPv2.0.gd P      m      ����,�tlaG���_!       res://icon.svg  @k      �      C��=U���^Qu��U3       res://icon.svg.import   �:      �       	஑9QJ�v�Wk��        res://mutiplayer22.tscn.remap   @j      i       �������̻���+       res://mutiplayerCardGPTV2.gd�D            ��>�L��Zq����       res://node_2dtest.tscn.remap�j      h       9!�)+_�\���� m    (   res://node_modules/.package-lock.json   �      ]      &��^�ʧ���N���    8   res://node_modules/uuid/dist/cjs-browser/package.json                  0Wk�#�$<��`S    0   res://node_modules/uuid/dist/cjs/package.json                  0Wk�#�$<��`S    $   res://node_modules/uuid/package.json@       �      �����?5r��
)r�z�    $   res://node_modules/ws/package.json  0      �      t'�1�����H�%��       res://package-lock.json �Y      �      )c��X`zT��S]       res://package.json  �`      �       E��²������Nĭ�       res://project.binarypo            &჆�A5�
WB	!ׇ�       res://testWEbsocket.gd  �c      U      ��p>|�3��i� �        {"type":"commonjs"}
            {"type":"commonjs"}
            {
  "name": "uuid",
  "version": "11.0.3",
  "description": "RFC9562 UUIDs",
  "type": "module",
  "funding": [
    "https://github.com/sponsors/broofa",
    "https://github.com/sponsors/ctavan"
  ],
  "commitlint": {
    "extends": [
      "@commitlint/config-conventional"
    ]
  },
  "keywords": [
    "uuid",
    "guid",
    "rfc4122",
    "rfc9562"
  ],
  "license": "MIT",
  "bin": {
    "uuid": "./dist/esm/bin/uuid"
  },
  "sideEffects": false,
  "main": "./dist/cjs/index.js",
  "exports": {
    ".": {
      "node": {
        "import": "./dist/esm/index.js",
        "require": "./dist/cjs/index.js"
      },
      "browser": {
        "import": "./dist/esm-browser/index.js",
        "require": "./dist/cjs-browser/index.js"
      },
      "default": "./dist/esm-browser/index.js"
    },
    "./package.json": "./package.json"
  },
  "module": "./dist/esm/index.js",
  "browser": {
    "./dist/esm/index.js": "./dist/esm-browser/index.js",
    "./dist/cjs/index.js": "./dist/cjs-browser/index.js"
  },
  "files": [
    "CHANGELOG.md",
    "CONTRIBUTING.md",
    "LICENSE.md",
    "README.md",
    "dist"
  ],
  "devDependencies": {
    "@babel/eslint-parser": "7.25.9",
    "@commitlint/cli": "19.5.0",
    "@commitlint/config-conventional": "19.5.0",
    "@eslint/js": "9.13.0",
    "@types/eslint__js": "8.42.3",
    "bundlewatch": "0.4.0",
    "commander": "12.1.0",
    "eslint": "9.13.0",
    "eslint-config-prettier": "9.1.0",
    "eslint-plugin-prettier": "5.2.1",
    "globals": "15.11.0",
    "husky": "9.1.6",
    "jest": "29.7.0",
    "lint-staged": "15.2.10",
    "neostandard": "0.11.7",
    "npm-run-all": "4.1.5",
    "prettier": "3.3.3",
    "release-please": "16.14.3",
    "runmd": "1.3.9",
    "standard-version": "9.5.0",
    "typescript": "5.6.3",
    "typescript-eslint": "8.11.0"
  },
  "optionalDevDependencies": {
    "@wdio/browserstack-service": "9.2.1",
    "@wdio/cli": "9.2.1",
    "@wdio/jasmine-framework": "9.2.1",
    "@wdio/local-runner": "9.2.1",
    "@wdio/spec-reporter": "9.1.3",
    "@wdio/static-server-service": "9.1.3"
  },
  "scripts": {
    "build": "./scripts/build.sh",
    "build:watch": "tsc --watch -p tsconfig.esm.json",
    "bundlewatch": "npm run pretest:browser && bundlewatch --config bundlewatch.config.json",
    "docs:diff": "npm run docs && git diff --quiet README.md",
    "docs": "npm run build && npx runmd --output=README.md README_js.md",
    "eslint:check": "eslint src/ test/ examples/ *.[jt]s",
    "eslint:fix": "eslint --fix src/ test/ examples/ *.[jt]s",
    "examples:browser:rollup:build": "cd examples/browser-rollup && npm install && npm run build",
    "examples:browser:webpack:build": "cd examples/browser-webpack && npm install && npm run build",
    "examples:node:commonjs:test": "cd examples/node-commonjs && npm install && npm test",
    "examples:node:esmodules:test": "cd examples/node-esmodules && npm install && npm test",
    "examples:node:jest:test": "cd examples/node-jest && npm install && npm test",
    "lint": "npm run eslint:check && npm run prettier:check",
    "md": "runmd --watch --output=README.md README_js.md",
    "prepack": "npm run build",
    "prepare": "husky",
    "pretest:benchmark": "npm run build",
    "pretest:browser": "./scripts/iodd && npm run build && npm-run-all --parallel examples:browser:**",
    "pretest:node": "npm run build",
    "pretest": "npm run build",
    "prettier:check": "prettier --check .",
    "prettier:fix": "prettier --write .",
    "release": "standard-version --no-verify",
    "test:benchmark": "cd examples/benchmark && HUSKY=0 npm install && npm test",
    "test:browser": "wdio run ./wdio.conf.js",
    "test:node": "npm-run-all --parallel examples:node:**",
    "test:pack": "./scripts/testpack.sh",
    "test:watch": "node --test --enable-source-maps --watch dist/esm/test/*.js",
    "test": "node --test --enable-source-maps dist/esm/test/*.js"
  },
  "repository": {
    "type": "git",
    "url": "https://github.com/uuidjs/uuid.git"
  },
  "lint-staged": {
    "*": [
      "prettier --no-error-on-unmatched-pattern --write"
    ],
    "*.{js,jsx}": [
      "eslint --no-error-on-unmatched-pattern --fix"
    ]
  },
  "standard-version": {
    "scripts": {
      "postchangelog": "prettier --write CHANGELOG.md"
    }
  },
  "packageManager": "npm@10.9.0"
}
              {
  "name": "ws",
  "version": "8.18.0",
  "description": "Simple to use, blazing fast and thoroughly tested websocket client and server for Node.js",
  "keywords": [
    "HyBi",
    "Push",
    "RFC-6455",
    "WebSocket",
    "WebSockets",
    "real-time"
  ],
  "homepage": "https://github.com/websockets/ws",
  "bugs": "https://github.com/websockets/ws/issues",
  "repository": {
    "type": "git",
    "url": "git+https://github.com/websockets/ws.git"
  },
  "author": "Einar Otto Stangvik <einaros@gmail.com> (http://2x.io)",
  "license": "MIT",
  "main": "index.js",
  "exports": {
    ".": {
      "browser": "./browser.js",
      "import": "./wrapper.mjs",
      "require": "./index.js"
    },
    "./package.json": "./package.json"
  },
  "browser": "browser.js",
  "engines": {
    "node": ">=10.0.0"
  },
  "files": [
    "browser.js",
    "index.js",
    "lib/*.js",
    "wrapper.mjs"
  ],
  "scripts": {
    "test": "nyc --reporter=lcov --reporter=text mocha --throw-deprecation test/*.test.js",
    "integration": "mocha --throw-deprecation test/*.integration.js",
    "lint": "eslint . && prettier --check --ignore-path .gitignore \"**/*.{json,md,yaml,yml}\""
  },
  "peerDependencies": {
    "bufferutil": "^4.0.1",
    "utf-8-validate": ">=5.0.2"
  },
  "peerDependenciesMeta": {
    "bufferutil": {
      "optional": true
    },
    "utf-8-validate": {
      "optional": true
    }
  },
  "devDependencies": {
    "benchmark": "^2.1.4",
    "bufferutil": "^4.0.1",
    "eslint": "^9.0.0",
    "eslint-config-prettier": "^9.0.0",
    "eslint-plugin-prettier": "^5.0.0",
    "globals": "^15.0.0",
    "mocha": "^8.4.0",
    "nyc": "^15.0.0",
    "prettier": "^3.0.0",
    "utf-8-validate": "^6.0.0"
  }
}
      {
  "name": "godot-ws-server",
  "version": "1.0.0",
  "lockfileVersion": 2,
  "requires": true,
  "packages": {
    "node_modules/uuid": {
      "version": "11.0.3",
      "resolved": "https://registry.npmjs.org/uuid/-/uuid-11.0.3.tgz",
      "integrity": "sha512-d0z310fCWv5dJwnX1Y/MncBAqGMKEzlBb1AOf7z9K8ALnd0utBX/msg/fA0+sbyN1ihbMsLhrBlnl1ak7Wa0rg==",
      "funding": [
        "https://github.com/sponsors/broofa",
        "https://github.com/sponsors/ctavan"
      ],
      "bin": {
        "uuid": "dist/esm/bin/uuid"
      }
    },
    "node_modules/ws": {
      "version": "8.18.0",
      "resolved": "https://registry.npmjs.org/ws/-/ws-8.18.0.tgz",
      "integrity": "sha512-8VbfWfHLbbwu3+N6OKsOMpBdT4kXPDDB9cJk2bJ6mh9ucxdlnNvH1e+roYkKmN9Nxw2yjz7VzeO9oOz2zJ04Pw==",
      "engines": {
        "node": ">=10.0.0"
      },
      "peerDependencies": {
        "bufferutil": "^4.0.1",
        "utf-8-validate": ">=5.0.2"
      },
      "peerDependenciesMeta": {
        "bufferutil": {
          "optional": true
        },
        "utf-8-validate": {
          "optional": true
        }
      }
    }
  }
}
   extends Node
var Players ={}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
    extends Control

@export var server_url = "ws://localhost:8080"

var player_cards = []
var opponent_cards = []
var socket = WebSocketPeer.new()

func _ready():
	set_process(false)
	pass

func _process(delta):
	# Poll network events every frame
	socket.poll()
	var state = socket.get_ready_state()

	# WebSocketPeer.STATE_OPEN means the socket is connected and ready
	# to send and receive data.
	if state == WebSocketPeer.STATE_OPEN:
		while socket.get_available_packet_count():
			var data = JSON.parse_string(socket.get_packet().get_string_from_utf8())
			if data.type == "initial_state":
				player_cards = data.player_cards
				opponent_cards = data.opponent_cards
				display_cards()
			elif data.type == "card_drawn":
				print(data.client_request)
				# Add the drawn card to player's hand
				if(data.player == 0):
					print(data.client_request)
					if data.client_request == 0:
						player_cards.append(data.card)
					else: 
						opponent_cards.append(data.card)
				else:
					if(data.client_request == 0):
						opponent_cards.append(data.card)
					else:
						player_cards.append(data.card)				
				display_cards()
			elif data.type == "no_cards_left":
				print("No cards left in deck!")
			else:
				print("Invalid message received")
			print("Got data from server: ", socket.get_packet().get_string_from_utf8())

	# WebSocketPeer.STATE_CLOSING means the socket is closing.
	# It is important to keep polling for a clean close.
	elif state == WebSocketPeer.STATE_CLOSING:
		pass

	# WebSocketPeer.STATE_CLOSED means the connection has fully closed.
	# It is now safe to stop polling.
	elif state == WebSocketPeer.STATE_CLOSED:
		# The code will be -1 if the disconnection was not properly notified by the remote peer.
		var code = socket.get_close_code()
		print("WebSocket closed with code: %d. Clean: %s" % [code, code != -1])
		set_process(false) # Stop processing.

func _process_network_messages():
	if multiplayer.get_multiplayer_peer():
		while multiplayer.get_multiplayer_peer().get_available_packet_count() > 0:
			var pkt = multiplayer.get_multiplayer_peer().get_packet()
			var str = pkt.get_string_from_utf8()
			var msg = JSON.parse_string(str)
			if msg.error == OK:
				var data = msg.result
				if data.type == "initial_state":
					player_cards = data.player_cards
					opponent_cards = data.opponent_cards
					display_cards()
				elif data.type == "card_drawn":
					# Add the drawn card to player's hand
					if data.player == 0:
						player_cards.append(data.card)
					else:
						opponent_cards.append(data.card)
					display_cards()
				elif data.type == "no_cards_left":
					print("No cards left in deck!")
			else:
				print("Invalid message received")

func _send_message(msg):
	var packet = JSON.stringify(msg).to_utf8_buffer()
	socket.send(packet)

func _on_draw_button_pressed():
	_send_message({"type": "draw_card"})
	
func _on_join_pressed():
	var err = socket.connect_to_url(server_url)
	set_process(true)
	await get_tree().create_timer(2).timeout
	_send_message({"type": "request_initial_state"})
	if err != OK:
		print("Unable to connect")
		set_process(false)
	
func display_cards():
	var player_card_container = $PlayerCards
	var opponent_card_container = $OpponentCards
	clear_container(player_card_container)
	clear_container(opponent_card_container)

	for card in player_cards:
		var c = create_card(Color(0.2,0.6,1.0), "Front: " + card)
		player_card_container.add_child(c)

	for card in opponent_cards:
		var c = create_card(Color(1.0,0.5,0.5), "Back")
		opponent_card_container.add_child(c)

	print("Cards Display Updated: Player =", player_cards, " Opponent =", opponent_cards)

func clear_container(container: Control):
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






   GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
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
 RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script     res://HTML_MutiplayerGTPv2.0.gd ��������      local://PackedScene_sc6pp          PackedScene          	         names "         Control    layout_mode    anchors_preset    offset_right    offset_bottom    script    Host    offset_left    offset_top    text    Button    Join 
   StartGame 	   LineEdit    Label    PlayerCards2    VBoxContainer    OpponentCards2    PlayerCards    HBoxContainer    OpponentCards    DrawButton    _on_host_button_down    button_down    _on_join_pressed    pressed    _on_start_game_button_down    _on_draw_button_pressed    	   variants    1                    ��D     D               B     �B     �B     �B      Host      �B     �B     1C     �B      Join      XC     �B     �C      Start Game      �B     �A     �C     HB     �A     �A     tB     <B      Name:       �C     �C    ��C    ��C           �C     D     �B    ��C     �C    ��C     �C     �C     �A     �C     xB     5C     `C    ��C     �C   
   Draw card       node_count             nodes     �   ��������        ����                                              
      ����                                 	   	               
      ����            
                     	                  
      ����                                 	                        ����                                                   ����                                 	                        ����                                                   ����             !            "      #                     ����            $      %      &      '                     ����            (      )      *      +               
      ����            ,      -      .      /   	   0             conn_count             conns                                                                                
                              node_paths              editable_instances              version             RSRC           extends Control

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
  "lockfileVersion": 2,
  "requires": true,
  "packages": {
    "": {
      "name": "godot-ws-server",
      "version": "1.0.0",
      "dependencies": {
        "uuid": "^11.0.3",
        "ws": "^8.18.0"
      }
    },
    "node_modules/uuid": {
      "version": "11.0.3",
      "resolved": "https://registry.npmjs.org/uuid/-/uuid-11.0.3.tgz",
      "integrity": "sha512-d0z310fCWv5dJwnX1Y/MncBAqGMKEzlBb1AOf7z9K8ALnd0utBX/msg/fA0+sbyN1ihbMsLhrBlnl1ak7Wa0rg==",
      "funding": [
        "https://github.com/sponsors/broofa",
        "https://github.com/sponsors/ctavan"
      ],
      "bin": {
        "uuid": "dist/esm/bin/uuid"
      }
    },
    "node_modules/ws": {
      "version": "8.18.0",
      "resolved": "https://registry.npmjs.org/ws/-/ws-8.18.0.tgz",
      "integrity": "sha512-8VbfWfHLbbwu3+N6OKsOMpBdT4kXPDDB9cJk2bJ6mh9ucxdlnNvH1e+roYkKmN9Nxw2yjz7VzeO9oOz2zJ04Pw==",
      "engines": {
        "node": ">=10.0.0"
      },
      "peerDependencies": {
        "bufferutil": "^4.0.1",
        "utf-8-validate": ">=5.0.2"
      },
      "peerDependenciesMeta": {
        "bufferutil": {
          "optional": true
        },
        "utf-8-validate": {
          "optional": true
        }
      }
    }
  },
  "dependencies": {
    "uuid": {
      "version": "11.0.3",
      "resolved": "https://registry.npmjs.org/uuid/-/uuid-11.0.3.tgz",
      "integrity": "sha512-d0z310fCWv5dJwnX1Y/MncBAqGMKEzlBb1AOf7z9K8ALnd0utBX/msg/fA0+sbyN1ihbMsLhrBlnl1ak7Wa0rg=="
    },
    "ws": {
      "version": "8.18.0",
      "resolved": "https://registry.npmjs.org/ws/-/ws-8.18.0.tgz",
      "integrity": "sha512-8VbfWfHLbbwu3+N6OKsOMpBdT4kXPDDB9cJk2bJ6mh9ucxdlnNvH1e+roYkKmN9Nxw2yjz7VzeO9oOz2zJ04Pw==",
      "requires": {}
    }
  }
}
    {
  "name": "godot-ws-server",
  "version": "1.0.0",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  },
  "dependencies": {
    "uuid": "^11.0.3",
    "ws": "^8.18.0"
  }
}
 RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://testWEbsocket.gd ��������      local://PackedScene_d0g8t          PackedScene          	         names "         Node2D    script    	   variants                       node_count             nodes     	   ��������        ����                    conn_count              conns               node_paths              editable_instances              version             RSRC         extends Node

# The URL we will connect to.
@export var websocket_url = "ws://localhost:8080"

# Our WebSocketClient instance.
var socket = WebSocketPeer.new()

func _ready():
	# Initiate connection to the given URL.
	var err = socket.connect_to_url(websocket_url)
	if err != OK:
		print("Unable to connect")
		set_process(false)
	else:
		# Wait for the socket to connect.
		await get_tree().create_timer(2).timeout

		# Send data.
		var msg = {"type": "draw_card"}
		var packet = JSON.stringify(msg).to_utf8_buffer()
		socket.send(packet)

func _process(_delta):
	# Call this in _process or _physics_process. Data transfer and state updates
	# will only happen when calling this function.
	socket.poll()

	# get_ready_state() tells you what state the socket is in.
	var state = socket.get_ready_state()

	# WebSocketPeer.STATE_OPEN means the socket is connected and ready
	# to send and receive data.
	if state == WebSocketPeer.STATE_OPEN:
		while socket.get_available_packet_count():
			print("Got data from server: ", socket.get_packet().get_string_from_utf8())

	# WebSocketPeer.STATE_CLOSING means the socket is closing.
	# It is important to keep polling for a clean close.
	elif state == WebSocketPeer.STATE_CLOSING:
		pass

	# WebSocketPeer.STATE_CLOSED means the connection has fully closed.
	# It is now safe to stop polling.
	elif state == WebSocketPeer.STATE_CLOSED:
		# The code will be -1 if the disconnection was not properly notified by the remote peer.
		var code = socket.get_close_code()
		print("WebSocket closed with code: %d. Clean: %s" % [code, code != -1])
		set_process(false) # Stop processing.
           [remap]

path="res://.godot/exported/133200997/export-3a6129a06f76c6e250ecade6e0bfd370-mutiplayer22.scn"
       [remap]

path="res://.godot/exported/133200997/export-ef6d63c598694e877a9a7c9e44b684b3-node_2dtest.scn"
        list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             ?h+'��   res://icon.svg����&/�   res://mutiplayer22.tscn�M����T   res://node_2dtest.tscn             ECFG      application/config/name          cardGame Test Mutiplayer   application/run/main_scene          res://mutiplayer22.tscn    application/config/features(   "         4.1    GL Compatibility       application/config/icon         res://icon.svg     autoload/GameManager          *res://GameManager.gd   #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility4   rendering/textures/vram_compression/import_etc2_astc                 