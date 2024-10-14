class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e45cdf2843e25e890ba2d4e5323fe2a8c8845e741e0eb570f59595c5523acaa5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5a4051890bd927e28c24f1929478861561df6899e187d519c3708687052a19a2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8c1c0aec2ec249d96d9ea99b1a117ff1b45b48611488bf3019feaefd50143ebc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1899+7185ccad1.tar.xz"
  version "0.14.0-dev.1899+7185ccad1"
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
