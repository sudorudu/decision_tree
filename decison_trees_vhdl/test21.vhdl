compare : process(clk)
begin
	if clk='1' and clk'event then
		if rst='1' then
		elsif en='1' then
			if unsigned(input(2092)) > to_unsigned(6, input'length) then
				splitResult(0) <= '1';
			else
				splitResult(0) <= '0';
			end if;
			if unsigned(input(2091)) > to_unsigned(6, input'length) then
				splitResult(1) <= '1';
			else
				splitResult(1) <= '0';
			end if;
			if unsigned(input(1565)) > to_unsigned(11, input'length) then
				splitResult(2) <= '1';
			else
				splitResult(2) <= '0';
			end if;
			if unsigned(input(1505)) > to_unsigned(19, input'length) then
				splitResult(3) <= '1';
			else
				splitResult(3) <= '0';
			end if;
			if unsigned(input(2095)) > to_unsigned(18, input'length) then
				splitResult(4) <= '1';
			else
				splitResult(4) <= '0';
			end if;
			if unsigned(input(1138)) > to_unsigned(25, input'length) then
				splitResult(5) <= '1';
			else
				splitResult(5) <= '0';
			end if;
			if unsigned(input(1981)) > to_unsigned(12, input'length) then
				splitResult(6) <= '1';
			else
				splitResult(6) <= '0';
			end if;
			if unsigned(input(1033)) > to_unsigned(21, input'length) then
				splitResult(7) <= '1';
			else
				splitResult(7) <= '0';
			end if;
			if unsigned(input(401)) > to_unsigned(12, input'length) then
				splitResult(8) <= '1';
			else
				splitResult(8) <= '0';
			end if;
			if unsigned(input(1560)) > to_unsigned(49, input'length) then
				splitResult(9) <= '1';
			else
				splitResult(9) <= '0';
			end if;
			if unsigned(input(2085)) > to_unsigned(15, input'length) then
				splitResult(10) <= '1';
			else
				splitResult(10) <= '0';
			end if;
			if unsigned(input(2078)) > to_unsigned(7, input'length) then
				splitResult(11) <= '1';
			else
				splitResult(11) <= '0';
			end if;
			if unsigned(input(1545)) > to_unsigned(7, input'length) then
				splitResult(12) <= '1';
			else
				splitResult(12) <= '0';
			end if;
			if unsigned(input(909)) > to_unsigned(6, input'length) then
				splitResult(13) <= '1';
			else
				splitResult(13) <= '0';
			end if;
			if unsigned(input(3474)) > to_unsigned(7, input'length) then
				splitResult(14) <= '1';
			else
				splitResult(14) <= '0';
			end if;
			if unsigned(input(631)) > to_unsigned(1, input'length) then
				splitResult(15) <= '1';
			else
				splitResult(15) <= '0';
			end if;
			if unsigned(input(885)) > to_unsigned(9, input'length) then
				splitResult(16) <= '1';
			else
				splitResult(16) <= '0';
			end if;
			if unsigned(input(2370)) > to_unsigned(3, input'length) then
				splitResult(17) <= '1';
			else
				splitResult(17) <= '0';
			end if;
			if unsigned(input(1342)) > to_unsigned(2, input'length) then
				splitResult(18) <= '1';
			else
				splitResult(18) <= '0';
			end if;
			if unsigned(input(1554)) > to_unsigned(2, input'length) then
				splitResult(19) <= '1';
			else
				splitResult(19) <= '0';
			end if;
			if unsigned(input(1922)) > to_unsigned(4, input'length) then
				splitResult(20) <= '1';
			else
				splitResult(20) <= '0';
			end if;
			if unsigned(input(1040)) > to_unsigned(26, input'length) then
				splitResult(21) <= '1';
			else
				splitResult(21) <= '0';
			end if;
			if unsigned(input(1671)) > to_unsigned(8, input'length) then
				splitResult(22) <= '1';
			else
				splitResult(22) <= '0';
			end if;
			if unsigned(input(2737)) > to_unsigned(8, input'length) then
				splitResult(23) <= '1';
			else
				splitResult(23) <= '0';
			end if;
			if unsigned(input(859)) > to_unsigned(0, input'length) then
				splitResult(24) <= '1';
			else
				splitResult(24) <= '0';
			end if;
			if unsigned(input(1355)) > to_unsigned(21, input'length) then
				splitResult(25) <= '1';
			else
				splitResult(25) <= '0';
			end if;
			if unsigned(input(2005)) > to_unsigned(41, input'length) then
				splitResult(26) <= '1';
			else
				splitResult(26) <= '0';
			end if;
			if unsigned(input(3429)) > to_unsigned(5, input'length) then
				splitResult(27) <= '1';
			else
				splitResult(27) <= '0';
			end if;
			if unsigned(input(2397)) > to_unsigned(0, input'length) then
				splitResult(28) <= '1';
			else
				splitResult(28) <= '0';
			end if;
			if unsigned(input(3495)) > to_unsigned(3, input'length) then
				splitResult(29) <= '1';
			else
				splitResult(29) <= '0';
			end if;
			if unsigned(input(1761)) > to_unsigned(9, input'length) then
				splitResult(30) <= '1';
			else
				splitResult(30) <= '0';
			end if;
			if unsigned(input(2240)) > to_unsigned(37, input'length) then
				splitResult(31) <= '1';
			else
				splitResult(31) <= '0';
			end if;
			if unsigned(input(1883)) > to_unsigned(2, input'length) then
				splitResult(32) <= '1';
			else
				splitResult(32) <= '0';
			end if;
			if unsigned(input(1532)) > to_unsigned(15, input'length) then
				splitResult(33) <= '1';
			else
				splitResult(33) <= '0';
			end if;
			if unsigned(input(588)) > to_unsigned(31, input'length) then
				splitResult(34) <= '1';
			else
				splitResult(34) <= '0';
			end if;
			if unsigned(input(805)) > to_unsigned(5, input'length) then
				splitResult(35) <= '1';
			else
				splitResult(35) <= '0';
			end if;
			if unsigned(input(1388)) > to_unsigned(9, input'length) then
				splitResult(36) <= '1';
			else
				splitResult(36) <= '0';
			end if;
			if unsigned(input(797)) > to_unsigned(18, input'length) then
				splitResult(37) <= '1';
			else
				splitResult(37) <= '0';
			end if;
			if unsigned(input(276)) > to_unsigned(7, input'length) then
				splitResult(38) <= '1';
			else
				splitResult(38) <= '0';
			end if;
			if unsigned(input(1851)) > to_unsigned(8, input'length) then
				splitResult(39) <= '1';
			else
				splitResult(39) <= '0';
			end if;
			if unsigned(input(3445)) > to_unsigned(5, input'length) then
				splitResult(40) <= '1';
			else
				splitResult(40) <= '0';
			end if;
			if unsigned(input(2072)) > to_unsigned(8, input'length) then
				splitResult(41) <= '1';
			else
				splitResult(41) <= '0';
			end if;
			if unsigned(input(2400)) > to_unsigned(6, input'length) then
				splitResult(42) <= '1';
			else
				splitResult(42) <= '0';
			end if;
			if unsigned(input(1945)) > to_unsigned(23, input'length) then
				splitResult(43) <= '1';
			else
				splitResult(43) <= '0';
			end if;
			if unsigned(input(1922)) > to_unsigned(1, input'length) then
				splitResult(44) <= '1';
			else
				splitResult(44) <= '0';
			end if;
			if unsigned(input(1505)) > to_unsigned(8, input'length) then
				splitResult(45) <= '1';
			else
				splitResult(45) <= '0';
			end if;
			if unsigned(input(2798)) > to_unsigned(6, input'length) then
				splitResult(46) <= '1';
			else
				splitResult(46) <= '0';
			end if;
			if unsigned(input(1258)) > to_unsigned(7, input'length) then
				splitResult(47) <= '1';
			else
				splitResult(47) <= '0';
			end if;
			if unsigned(input(2233)) > to_unsigned(5, input'length) then
				splitResult(48) <= '1';
			else
				splitResult(48) <= '0';
			end if;
			if unsigned(input(1770)) > to_unsigned(2, input'length) then
				splitResult(49) <= '1';
			else
				splitResult(49) <= '0';
			end if;
			if unsigned(input(1794)) > to_unsigned(22, input'length) then
				splitResult(50) <= '1';
			else
				splitResult(50) <= '0';
			end if;
			if unsigned(input(2186)) > to_unsigned(11, input'length) then
				splitResult(51) <= '1';
			else
				splitResult(51) <= '0';
			end if;
			if unsigned(input(1237)) > to_unsigned(132, input'length) then
				splitResult(52) <= '1';
			else
				splitResult(52) <= '0';
			end if;
			if unsigned(input(59)) > to_unsigned(28, input'length) then
				splitResult(53) <= '1';
			else
				splitResult(53) <= '0';
			end if;
			if unsigned(input(236)) > to_unsigned(28, input'length) then
				splitResult(54) <= '1';
			else
				splitResult(54) <= '0';
			end if;
			if unsigned(input(2156)) > to_unsigned(27, input'length) then
				splitResult(55) <= '1';
			else
				splitResult(55) <= '0';
			end if;
			if unsigned(input(1950)) > to_unsigned(16, input'length) then
				splitResult(56) <= '1';
			else
				splitResult(56) <= '0';
			end if;
			if unsigned(input(2064)) > to_unsigned(47, input'length) then
				splitResult(57) <= '1';
			else
				splitResult(57) <= '0';
			end if;
			if unsigned(input(2538)) > to_unsigned(18, input'length) then
				splitResult(58) <= '1';
			else
				splitResult(58) <= '0';
			end if;
			if unsigned(input(2088)) > to_unsigned(15, input'length) then
				splitResult(59) <= '1';
			else
				splitResult(59) <= '0';
			end if;
			if unsigned(input(1643)) > to_unsigned(12, input'length) then
				splitResult(60) <= '1';
			else
				splitResult(60) <= '0';
			end if;
			if unsigned(input(697)) > to_unsigned(9, input'length) then
				splitResult(61) <= '1';
			else
				splitResult(61) <= '0';
			end if;
			if unsigned(input(125)) > to_unsigned(15, input'length) then
				splitResult(62) <= '1';
			else
				splitResult(62) <= '0';
			end if;
			if unsigned(input(1017)) > to_unsigned(7, input'length) then
				splitResult(63) <= '1';
			else
				splitResult(63) <= '0';
			end if;
			if unsigned(input(335)) > to_unsigned(14, input'length) then
				splitResult(64) <= '1';
			else
				splitResult(64) <= '0';
			end if;
			if unsigned(input(129)) > to_unsigned(9, input'length) then
				splitResult(65) <= '1';
			else
				splitResult(65) <= '0';
			end if;
			if unsigned(input(2602)) > to_unsigned(3, input'length) then
				splitResult(66) <= '1';
			else
				splitResult(66) <= '0';
			end if;
			if unsigned(input(2053)) > to_unsigned(9, input'length) then
				splitResult(67) <= '1';
			else
				splitResult(67) <= '0';
			end if;
			if unsigned(input(2018)) > to_unsigned(0, input'length) then
				splitResult(68) <= '1';
			else
				splitResult(68) <= '0';
			end if;
			if unsigned(input(3494)) > to_unsigned(0, input'length) then
				splitResult(69) <= '1';
			else
				splitResult(69) <= '0';
			end if;
			if unsigned(input(1828)) > to_unsigned(47, input'length) then
				splitResult(70) <= '1';
			else
				splitResult(70) <= '0';
			end if;
			if unsigned(input(1564)) > to_unsigned(7, input'length) then
				splitResult(71) <= '1';
			else
				splitResult(71) <= '0';
			end if;
			if unsigned(input(2004)) > to_unsigned(16, input'length) then
				splitResult(72) <= '1';
			else
				splitResult(72) <= '0';
			end if;
			if unsigned(input(912)) > to_unsigned(1, input'length) then
				splitResult(73) <= '1';
			else
				splitResult(73) <= '0';
			end if;
			if unsigned(input(564)) > to_unsigned(0, input'length) then
				splitResult(74) <= '1';
			else
				splitResult(74) <= '0';
			end if;
			if unsigned(input(8)) > to_unsigned(0, input'length) then
				splitResult(75) <= '1';
			else
				splitResult(75) <= '0';
			end if;
			if unsigned(input(325)) > to_unsigned(14, input'length) then
				splitResult(76) <= '1';
			else
				splitResult(76) <= '0';
			end if;
			if unsigned(input(1380)) > to_unsigned(2, input'length) then
				splitResult(77) <= '1';
			else
				splitResult(77) <= '0';
			end if;
			if unsigned(input(1563)) > to_unsigned(5, input'length) then
				splitResult(78) <= '1';
			else
				splitResult(78) <= '0';
			end if;
			if unsigned(input(1370)) > to_unsigned(3, input'length) then
				splitResult(79) <= '1';
			else
				splitResult(79) <= '0';
			end if;
			if unsigned(input(2190)) > to_unsigned(8, input'length) then
				splitResult(80) <= '1';
			else
				splitResult(80) <= '0';
			end if;
			if unsigned(input(1394)) > to_unsigned(12, input'length) then
				splitResult(81) <= '1';
			else
				splitResult(81) <= '0';
			end if;
			if unsigned(input(2554)) > to_unsigned(1, input'length) then
				splitResult(82) <= '1';
			else
				splitResult(82) <= '0';
			end if;
		end if;
	end if;
end process compare;

decideClass : process(clk)
begin
	if clk='1' and clk'event then
		if rst='1' then
		
		elsif en='1' then
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '0'
				and
				splitResult(3) = '0'
				and
				splitResult(4) = '0'
				and
				splitResult(5) = '0'
				and
				splitResult(6) = '0'
				and
				splitResult(7) = '0'
				and
				splitResult(8) = '0'
				and
				splitResult(9) = '0'
				and
				splitResult(10) = '0'
				and
				splitResult(11) = '0'
				and
				splitResult(12) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '0'
				and
				splitResult(3) = '0'
				and
				splitResult(4) = '0'
				and
				splitResult(5) = '0'
				and
				splitResult(6) = '0'
				and
				splitResult(7) = '0'
				and
				splitResult(8) = '0'
				and
				splitResult(9) = '0'
				and
				splitResult(10) = '0'
				and
				splitResult(11) = '0'
				and
				splitResult(12) = '1'
				and
				splitResult(13) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '0'
				and
				splitResult(3) = '0'
				and
				splitResult(4) = '0'
				and
				splitResult(5) = '0'
				and
				splitResult(6) = '0'
				and
				splitResult(7) = '0'
				and
				splitResult(8) = '0'
				and
				splitResult(9) = '0'
				and
				splitResult(10) = '0'
				and
				splitResult(11) = '0'
				and
				splitResult(12) = '1'
				and
				splitResult(13) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '0'
				and
				splitResult(3) = '0'
				and
				splitResult(4) = '0'
				and
				splitResult(5) = '0'
				and
				splitResult(6) = '0'
				and
				splitResult(7) = '0'
				and
				splitResult(8) = '0'
				and
				splitResult(9) = '0'
				and
				splitResult(10) = '0'
				and
				splitResult(11) = '1'
				and
				splitResult(14) = '0'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '0'
				and
				splitResult(3) = '0'
				and
				splitResult(4) = '0'
				and
				splitResult(5) = '0'
				and
				splitResult(6) = '0'
				and
				splitResult(7) = '0'
				and
				splitResult(8) = '0'
				and
				splitResult(9) = '0'
				and
				splitResult(10) = '0'
				and
				splitResult(11) = '1'
				and
				splitResult(14) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '0'
				and
				splitResult(3) = '0'
				and
				splitResult(4) = '0'
				and
				splitResult(5) = '0'
				and
				splitResult(6) = '0'
				and
				splitResult(7) = '0'
				and
				splitResult(8) = '0'
				and
				splitResult(9) = '0'
				and
				splitResult(10) = '1'
				and
				splitResult(15) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '0'
				and
				splitResult(3) = '0'
				and
				splitResult(4) = '0'
				and
				splitResult(5) = '0'
				and
				splitResult(6) = '0'
				and
				splitResult(7) = '0'
				and
				splitResult(8) = '0'
				and
				splitResult(9) = '0'
				and
				splitResult(10) = '1'
				and
				splitResult(15) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '0'
				and
				splitResult(3) = '0'
				and
				splitResult(4) = '0'
				and
				splitResult(5) = '0'
				and
				splitResult(6) = '0'
				and
				splitResult(7) = '0'
				and
				splitResult(8) = '0'
				and
				splitResult(9) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '0'
				and
				splitResult(3) = '0'
				and
				splitResult(4) = '0'
				and
				splitResult(5) = '0'
				and
				splitResult(6) = '0'
				and
				splitResult(7) = '0'
				and
				splitResult(8) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '0'
				and
				splitResult(3) = '0'
				and
				splitResult(4) = '0'
				and
				splitResult(5) = '0'
				and
				splitResult(6) = '0'
				and
				splitResult(7) = '1'
				and
				splitResult(16) = '0'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '0'
				and
				splitResult(3) = '0'
				and
				splitResult(4) = '0'
				and
				splitResult(5) = '0'
				and
				splitResult(6) = '0'
				and
				splitResult(7) = '1'
				and
				splitResult(16) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '0'
				and
				splitResult(3) = '0'
				and
				splitResult(4) = '0'
				and
				splitResult(5) = '0'
				and
				splitResult(6) = '1'
				and
				splitResult(17) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '0'
				and
				splitResult(3) = '0'
				and
				splitResult(4) = '0'
				and
				splitResult(5) = '0'
				and
				splitResult(6) = '1'
				and
				splitResult(17) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '0'
				and
				splitResult(3) = '0'
				and
				splitResult(4) = '0'
				and
				splitResult(5) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '0'
				and
				splitResult(3) = '0'
				and
				splitResult(4) = '1'
				and
				splitResult(18) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '0'
				and
				splitResult(3) = '0'
				and
				splitResult(4) = '1'
				and
				splitResult(18) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '0'
				and
				splitResult(3) = '1'
				and
				splitResult(19) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '0'
				and
				splitResult(3) = '1'
				and
				splitResult(19) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '1'
				and
				splitResult(20) = '0'
				and
				splitResult(21) = '0'
				and
				splitResult(22) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '1'
				and
				splitResult(20) = '0'
				and
				splitResult(21) = '0'
				and
				splitResult(22) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '1'
				and
				splitResult(20) = '0'
				and
				splitResult(21) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '1'
				and
				splitResult(20) = '1'
				and
				splitResult(23) = '0'
				and
				splitResult(24) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '1'
				and
				splitResult(20) = '1'
				and
				splitResult(23) = '0'
				and
				splitResult(24) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '0'
				and
				splitResult(2) = '1'
				and
				splitResult(20) = '1'
				and
				splitResult(23) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '0'
				and
				splitResult(26) = '0'
				and
				splitResult(27) = '0'
				and
				splitResult(28) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '0'
				and
				splitResult(26) = '0'
				and
				splitResult(27) = '0'
				and
				splitResult(28) = '1'
				and
				splitResult(29) = '0'
				and
				splitResult(30) = '0'
				and
				splitResult(31) = '0'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '0'
				and
				splitResult(26) = '0'
				and
				splitResult(27) = '0'
				and
				splitResult(28) = '1'
				and
				splitResult(29) = '0'
				and
				splitResult(30) = '0'
				and
				splitResult(31) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '0'
				and
				splitResult(26) = '0'
				and
				splitResult(27) = '0'
				and
				splitResult(28) = '1'
				and
				splitResult(29) = '0'
				and
				splitResult(30) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '0'
				and
				splitResult(26) = '0'
				and
				splitResult(27) = '0'
				and
				splitResult(28) = '1'
				and
				splitResult(29) = '1'
				and
				splitResult(32) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '0'
				and
				splitResult(26) = '0'
				and
				splitResult(27) = '0'
				and
				splitResult(28) = '1'
				and
				splitResult(29) = '1'
				and
				splitResult(32) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '0'
				and
				splitResult(26) = '0'
				and
				splitResult(27) = '1'
				and
				splitResult(33) = '0'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '0'
				and
				splitResult(26) = '0'
				and
				splitResult(27) = '1'
				and
				splitResult(33) = '1'
				and
				splitResult(34) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '0'
				and
				splitResult(26) = '0'
				and
				splitResult(27) = '1'
				and
				splitResult(33) = '1'
				and
				splitResult(34) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '0'
				and
				splitResult(26) = '1'
				and
				splitResult(35) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '0'
				and
				splitResult(26) = '1'
				and
				splitResult(35) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '1'
				and
				splitResult(36) = '0'
				and
				splitResult(37) = '0'
				and
				splitResult(38) = '0'
				and
				splitResult(39) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '1'
				and
				splitResult(36) = '0'
				and
				splitResult(37) = '0'
				and
				splitResult(38) = '0'
				and
				splitResult(39) = '1'
				and
				splitResult(40) = '0'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '1'
				and
				splitResult(36) = '0'
				and
				splitResult(37) = '0'
				and
				splitResult(38) = '0'
				and
				splitResult(39) = '1'
				and
				splitResult(40) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '1'
				and
				splitResult(36) = '0'
				and
				splitResult(37) = '0'
				and
				splitResult(38) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '1'
				and
				splitResult(36) = '0'
				and
				splitResult(37) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '1'
				and
				splitResult(36) = '1'
				and
				splitResult(41) = '0'
				and
				splitResult(42) = '0'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '1'
				and
				splitResult(36) = '1'
				and
				splitResult(41) = '0'
				and
				splitResult(42) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '0'
				and
				splitResult(1) = '1'
				and
				splitResult(25) = '1'
				and
				splitResult(36) = '1'
				and
				splitResult(41) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '0'
				and
				splitResult(45) = '0'
				and
				splitResult(46) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '0'
				and
				splitResult(45) = '0'
				and
				splitResult(46) = '1'
				and
				splitResult(47) = '0'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '0'
				and
				splitResult(45) = '0'
				and
				splitResult(46) = '1'
				and
				splitResult(47) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '0'
				and
				splitResult(45) = '1'
				and
				splitResult(48) = '0'
				and
				splitResult(49) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '0'
				and
				splitResult(45) = '1'
				and
				splitResult(48) = '0'
				and
				splitResult(49) = '1'
				and
				splitResult(50) = '0'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '0'
				and
				splitResult(45) = '1'
				and
				splitResult(48) = '0'
				and
				splitResult(49) = '1'
				and
				splitResult(50) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '0'
				and
				splitResult(45) = '1'
				and
				splitResult(48) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '0'
				and
				splitResult(54) = '0'
				and
				splitResult(55) = '0'
				and
				splitResult(56) = '0'
				and
				splitResult(57) = '0'
				and
				splitResult(58) = '0'
				and
				splitResult(59) = '0'
				and
				splitResult(60) = '0'
				and
				splitResult(61) = '0'
				and
				splitResult(62) = '0'
				and
				splitResult(63) = '0'
				and
				splitResult(64) = '0'
				and
				splitResult(65) = '0'
				and
				splitResult(66) = '0'
				and
				splitResult(67) = '0'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '0'
				and
				splitResult(54) = '0'
				and
				splitResult(55) = '0'
				and
				splitResult(56) = '0'
				and
				splitResult(57) = '0'
				and
				splitResult(58) = '0'
				and
				splitResult(59) = '0'
				and
				splitResult(60) = '0'
				and
				splitResult(61) = '0'
				and
				splitResult(62) = '0'
				and
				splitResult(63) = '0'
				and
				splitResult(64) = '0'
				and
				splitResult(65) = '0'
				and
				splitResult(66) = '0'
				and
				splitResult(67) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '0'
				and
				splitResult(54) = '0'
				and
				splitResult(55) = '0'
				and
				splitResult(56) = '0'
				and
				splitResult(57) = '0'
				and
				splitResult(58) = '0'
				and
				splitResult(59) = '0'
				and
				splitResult(60) = '0'
				and
				splitResult(61) = '0'
				and
				splitResult(62) = '0'
				and
				splitResult(63) = '0'
				and
				splitResult(64) = '0'
				and
				splitResult(65) = '0'
				and
				splitResult(66) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '0'
				and
				splitResult(54) = '0'
				and
				splitResult(55) = '0'
				and
				splitResult(56) = '0'
				and
				splitResult(57) = '0'
				and
				splitResult(58) = '0'
				and
				splitResult(59) = '0'
				and
				splitResult(60) = '0'
				and
				splitResult(61) = '0'
				and
				splitResult(62) = '0'
				and
				splitResult(63) = '0'
				and
				splitResult(64) = '0'
				and
				splitResult(65) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '0'
				and
				splitResult(54) = '0'
				and
				splitResult(55) = '0'
				and
				splitResult(56) = '0'
				and
				splitResult(57) = '0'
				and
				splitResult(58) = '0'
				and
				splitResult(59) = '0'
				and
				splitResult(60) = '0'
				and
				splitResult(61) = '0'
				and
				splitResult(62) = '0'
				and
				splitResult(63) = '0'
				and
				splitResult(64) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '0'
				and
				splitResult(54) = '0'
				and
				splitResult(55) = '0'
				and
				splitResult(56) = '0'
				and
				splitResult(57) = '0'
				and
				splitResult(58) = '0'
				and
				splitResult(59) = '0'
				and
				splitResult(60) = '0'
				and
				splitResult(61) = '0'
				and
				splitResult(62) = '0'
				and
				splitResult(63) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '0'
				and
				splitResult(54) = '0'
				and
				splitResult(55) = '0'
				and
				splitResult(56) = '0'
				and
				splitResult(57) = '0'
				and
				splitResult(58) = '0'
				and
				splitResult(59) = '0'
				and
				splitResult(60) = '0'
				and
				splitResult(61) = '0'
				and
				splitResult(62) = '1'
				and
				splitResult(68) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '0'
				and
				splitResult(54) = '0'
				and
				splitResult(55) = '0'
				and
				splitResult(56) = '0'
				and
				splitResult(57) = '0'
				and
				splitResult(58) = '0'
				and
				splitResult(59) = '0'
				and
				splitResult(60) = '0'
				and
				splitResult(61) = '0'
				and
				splitResult(62) = '1'
				and
				splitResult(68) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '0'
				and
				splitResult(54) = '0'
				and
				splitResult(55) = '0'
				and
				splitResult(56) = '0'
				and
				splitResult(57) = '0'
				and
				splitResult(58) = '0'
				and
				splitResult(59) = '0'
				and
				splitResult(60) = '0'
				and
				splitResult(61) = '1'
				and
				splitResult(69) = '0'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '0'
				and
				splitResult(54) = '0'
				and
				splitResult(55) = '0'
				and
				splitResult(56) = '0'
				and
				splitResult(57) = '0'
				and
				splitResult(58) = '0'
				and
				splitResult(59) = '0'
				and
				splitResult(60) = '0'
				and
				splitResult(61) = '1'
				and
				splitResult(69) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '0'
				and
				splitResult(54) = '0'
				and
				splitResult(55) = '0'
				and
				splitResult(56) = '0'
				and
				splitResult(57) = '0'
				and
				splitResult(58) = '0'
				and
				splitResult(59) = '0'
				and
				splitResult(60) = '1'
				and
				splitResult(70) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '0'
				and
				splitResult(54) = '0'
				and
				splitResult(55) = '0'
				and
				splitResult(56) = '0'
				and
				splitResult(57) = '0'
				and
				splitResult(58) = '0'
				and
				splitResult(59) = '0'
				and
				splitResult(60) = '1'
				and
				splitResult(70) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '0'
				and
				splitResult(54) = '0'
				and
				splitResult(55) = '0'
				and
				splitResult(56) = '0'
				and
				splitResult(57) = '0'
				and
				splitResult(58) = '0'
				and
				splitResult(59) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '0'
				and
				splitResult(54) = '0'
				and
				splitResult(55) = '0'
				and
				splitResult(56) = '0'
				and
				splitResult(57) = '0'
				and
				splitResult(58) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '0'
				and
				splitResult(54) = '0'
				and
				splitResult(55) = '0'
				and
				splitResult(56) = '0'
				and
				splitResult(57) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '0'
				and
				splitResult(54) = '0'
				and
				splitResult(55) = '0'
				and
				splitResult(56) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '0'
				and
				splitResult(54) = '0'
				and
				splitResult(55) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '0'
				and
				splitResult(54) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '0'
				and
				splitResult(53) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '0'
				and
				splitResult(52) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '0'
				and
				splitResult(44) = '1'
				and
				splitResult(51) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '1'
				and
				splitResult(71) = '0'
				and
				splitResult(72) = '0'
				and
				splitResult(73) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '1'
				and
				splitResult(71) = '0'
				and
				splitResult(72) = '0'
				and
				splitResult(73) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '1'
				and
				splitResult(71) = '0'
				and
				splitResult(72) = '1'
				and
				splitResult(74) = '0'
				and
				splitResult(75) = '0'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '1'
				and
				splitResult(71) = '0'
				and
				splitResult(72) = '1'
				and
				splitResult(74) = '0'
				and
				splitResult(75) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '1'
				and
				splitResult(71) = '0'
				and
				splitResult(72) = '1'
				and
				splitResult(74) = '1'
				and
				splitResult(76) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '1'
				and
				splitResult(71) = '0'
				and
				splitResult(72) = '1'
				and
				splitResult(74) = '1'
				and
				splitResult(76) = '1'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '1'
				and
				splitResult(71) = '1'
				and
				splitResult(77) = '0'
				and
				splitResult(78) = '0'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '1'
				and
				splitResult(71) = '1'
				and
				splitResult(77) = '0'
				and
				splitResult(78) = '1'
				and
				splitResult(79) = '0'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '1'
				and
				splitResult(71) = '1'
				and
				splitResult(77) = '0'
				and
				splitResult(78) = '1'
				and
				splitResult(79) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '1'
				and
				splitResult(71) = '1'
				and
				splitResult(77) = '1'
				and
				splitResult(80) = '0'
				and
				splitResult(81) = '0'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '1'
				and
				splitResult(71) = '1'
				and
				splitResult(77) = '1'
				and
				splitResult(80) = '0'
				and
				splitResult(81) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '1'
				and
				splitResult(71) = '1'
				and
				splitResult(77) = '1'
				and
				splitResult(80) = '1'
				and
				splitResult(82) = '0'
				 ) then
					classIndex <= to_unsigned(1, classIndex'length);
				end if;
			if ( 
				splitResult(0) = '1'
				and
				splitResult(43) = '1'
				and
				splitResult(71) = '1'
				and
				splitResult(77) = '1'
				and
				splitResult(80) = '1'
				and
				splitResult(82) = '1'
				 ) then
					classIndex <= to_unsigned(0, classIndex'length);
				end if;
		end if;
	end if;
end process decideClass;