class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3356c7222acb82b1da00aaeb71d80a1fd15284ae9c55939069b161cb45498db5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8584e03f54cee6efdbb44e02605722bfcd66a0ee938973c4b689483423bfa05e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1e1bd0f1411506add35bd1edde81df578944c8ab2065662d315dc6d8ffd5774c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1768+39a966b0a.tar.xz"
  version "0.12.0-dev.1768+39a966b0a"
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
