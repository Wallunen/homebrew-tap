class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d319afe424f8becd40f249bf1c5d00a6392be06909bafd7556f368f131524711" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5eb0b852dc85867626988726c21d5ba8d751d1bc53075b986227ad3cbc8fa43f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a8e7e564dda499a09db63c429bcd8ec872af46616404e9627f13cdbf81281aa0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.544+7aaebd177.tar.xz"
  version "0.14.0-dev.544+7aaebd177"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
